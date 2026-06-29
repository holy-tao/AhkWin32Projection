#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether communication is bidirectional or unidirectional between applications and Print Spooler-hosted components such as printer drivers, print processors, and port monitors.
 * @remarks
 * Even when the communication is bidirectional, applications cannot initiate communication. They can only reply to notifications sent by the Print Spooler-hosted components.
 * 
 * When multiple applications listen for bidirectional notifications, they receive only the first notification sent through a bidirectional channel. The Print Spooler maintains the channel only with the first listening application that responded, and discards all subsequent replies from other listeners.
 * @see https://learn.microsoft.com/windows/win32/api/prnasnot/ne-prnasnot-printasyncnotifyconversationstyle
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PrintAsyncNotifyConversationStyle {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that applications can send replies to the Print Spooler-hosted component that sent a notification.
     * @type {Integer (Int32)}
     */
    static kBiDirectional => 0

    /**
     * Indicates that communication goes only from the Print Spooler-hosted component to one or more listening applications.
     * @type {Integer (Int32)}
     */
    static kUniDirectional => 1
}
