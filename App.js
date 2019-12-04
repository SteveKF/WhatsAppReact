/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, { useState } from 'react'
import { SafeAreaView, StatusBar, StyleSheet, Button } from 'react-native'
import { ChatViewScreen, ConversationsScreen } from './src/screens'

const App: () => React$Node = () => {
    const [isConversation, setIsConversation] = useState(false)
    return (
        <>
            <StatusBar barStyle="dark-content" />
            <SafeAreaView>
                {isConversation ? <ConversationsScreen /> : <ChatViewScreen />}
                <Button title="Switch Screen" onPress={() => setIsConversation(!isConversation)} />
            </SafeAreaView>
        </>
    )
}

const styles = StyleSheet.create({})

export default App
