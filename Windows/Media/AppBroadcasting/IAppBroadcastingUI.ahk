#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AppBroadcastingStatus.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.AppBroadcasting
 * @version WindowsRuntime 1.4
 */
class IAppBroadcastingUI extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBroadcastingUI
     * @type {Guid}
     */
    static IID => Guid("{e56f9f8f-ee99-4dca-a3c3-70af3db44f5f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatus", "ShowBroadcastUI"]

    /**
     * 
     * @returns {AppBroadcastingStatus} 
     */
    GetStatus() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBroadcastingStatus(result_)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShowBroadcastUI() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
