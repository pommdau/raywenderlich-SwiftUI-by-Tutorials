@testable import TCADemo
import ComposableArchitecture
import XCTest


@MainActor
final class CounterFeatureTests: XCTestCase {
    func testCounter() async {
        // 初期状態を提供し、Closureで提供する機能を定義
        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        }
        
        await store.send(.incrementButtonTapped) {
            // そのアクションが送信された後に状態がどのように変化するかを正確に記述する必要がある
            // $0: CounterFeature.State
            $0.count = 1
        }
        await store.send(.decrementButtonTapped) {
            $0.count = 0
        }
    }
}
