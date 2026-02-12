#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MiracastReceiverConnection.ahk
#Include ..\Core\MediaSource.ahk
#Include .\MiracastReceiverCursorImageChannelSettings.ahk
#Include ..\..\Foundation\Deferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class IMiracastReceiverMediaSourceCreatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMiracastReceiverMediaSourceCreatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{17cf519e-1246-531d-945a-6b158e39c3aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Connection", "get_MediaSource", "get_CursorImageChannelSettings", "GetDeferral"]

    /**
     * @type {MiracastReceiverConnection} 
     */
    Connection {
        get => this.get_Connection()
    }

    /**
     * @type {MediaSource} 
     */
    MediaSource {
        get => this.get_MediaSource()
    }

    /**
     * @type {MiracastReceiverCursorImageChannelSettings} 
     */
    CursorImageChannelSettings {
        get => this.get_CursorImageChannelSettings()
    }

    /**
     * 
     * @returns {MiracastReceiverConnection} 
     */
    get_Connection() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MiracastReceiverConnection(value)
    }

    /**
     * 
     * @returns {MediaSource} 
     */
    get_MediaSource() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaSource(value)
    }

    /**
     * 
     * @returns {MiracastReceiverCursorImageChannelSettings} 
     */
    get_CursorImageChannelSettings() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MiracastReceiverCursorImageChannelSettings(value)
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(result_)
    }
}
