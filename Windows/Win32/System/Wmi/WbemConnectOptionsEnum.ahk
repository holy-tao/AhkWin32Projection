#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines a security flag that is used as a parameter in calls to the SWbemLocator.ConnectServer method when a connection to WMI on a remote machine is failing.
 * @see https://learn.microsoft.com/windows/win32/api/wbemdisp/ne-wbemdisp-wbemconnectoptionsenum
 * @namespace Windows.Win32.System.Wmi
 */
export default struct WbemConnectOptionsEnum {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Shortens the timeout for the <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/swbemlocator-connectserver">SWbemLocator.ConnectServer</a> method call to two minutes.
     * @type {Integer (Int32)}
     */
    static wbemConnectFlagUseMaxWait => 128
}
