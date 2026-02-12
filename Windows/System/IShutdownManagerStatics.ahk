#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IShutdownManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShutdownManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{72e247ed-dd5b-4d6c-b1d0-c57a7bbb5f94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginShutdown", "CancelShutdown"]

    /**
     * 
     * @param {Integer} shutdownKind_ 
     * @param {TimeSpan} timeout 
     * @returns {HRESULT} 
     */
    BeginShutdown(shutdownKind_, timeout) {
        result := ComCall(6, this, "int", shutdownKind_, "ptr", timeout, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelShutdown() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
