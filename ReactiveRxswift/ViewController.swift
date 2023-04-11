//
//  ViewController.swift
//  ReactiveRxswift
//
//  Created by Vitor Henrique Barreiro Marinho on 10/04/23.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
//        skipCount()
//        skipWhile()
//        skipUntil()
//        skipUntillTwo()
//        takeCount()
//        takeWhile()
        takeUntil()
    }
 

}

//MARK: - Skip Operators

extension ViewController {
    private func skipCount() {
        Observable.from(Array(1...10))
            .skip(7)
            .subscribe({
            print ($0)
        }).disposed(by: disposeBag)
    }

    private func skipWhile(){
        Observable.from(Array(1...10))
            .skip(while: {
            $0 < 3
        }).subscribe({print ($0)})
            .disposed(by: disposeBag)
    }
    
    private func skipUntil(){
        let subject = PublishSubject<Int>()
        let trigger = PublishSubject<String>()
        
        subject.skip(until: trigger)
            .subscribe({print ($0)})
            .disposed(by: disposeBag)
        
        subject.onNext(1)
        
        subject.onNext(2)
        
        trigger.onNext("Start now")
        
        subject.onNext(3)
        
        subject.onNext(4)
    }
    
    private func skipUntillTwo() {
        let subject = PublishSubject<Int>()
        let trigger = PublishSubject<Void>()
        
        subject.skip(until: trigger)
            .subscribe({print ($0)})
            .disposed(by: disposeBag)
        
        subject.onNext(2)
        subject.onNext(3)
        
        trigger.onNext(showTrigger())
        
        subject.onNext(4)
        subject.onNext(5)
        
        func showTrigger() {
            print ("Start")
        }
    }
}


//MARK: - Take Operators

// É o oposto do Skip operator, ou seja, ao invés de pular o valor irá pegar os valores que atendem determinada condição

extension ViewController {
    
    private func takeCount() {
        Observable.from(Array(1...10))
            .take(4)
            .subscribe({
            print ($0)
        }).disposed(by: disposeBag)
    }
    
    private func takeWhile() {
        Observable.from([1,2,3,4,5,6,7,8,9,10])
            .take(while: {
            return $0 < 5
        }).subscribe({print($0)})
            .disposed(by: disposeBag)
    }
    
    private func takeUntil() {
        
        let subject = PublishSubject<Int>()
        let trigger = PublishSubject<Void>()
        
        subject.take(until: trigger)
            .subscribe({print ($0)})
            .disposed(by: disposeBag)
        
        subject.onNext(1)
        subject.onNext(2)
        subject.onNext(3)
        subject.onNext(4)
        
        trigger.onNext(showTrigger())
        
        subject.onNext(5)
        subject.onNext(6)

        
        func showTrigger() {
            
            print ("Start")
        }
        
        
        
    }
    
    
}
