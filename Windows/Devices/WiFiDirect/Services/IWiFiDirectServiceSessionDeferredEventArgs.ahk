#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class IWiFiDirectServiceSessionDeferredEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiDirectServiceSessionDeferredEventArgs
     * @type {Guid}
     */
    static IID => Guid("{8dfc197f-1201-4f1f-b6f4-5df1b7b9fb2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeferredSessionInfo"]

    /**
     * @type {IBuffer} 
     */
    DeferredSessionInfo {
        get => this.get_DeferredSessionInfo()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_DeferredSessionInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }
}
