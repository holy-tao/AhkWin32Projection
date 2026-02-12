#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Display
 * @version WindowsRuntime 1.4
 */
class IDisplayRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayRequest
     * @type {Guid}
     */
    static IID => Guid("{e5732044-f49f-4b60-8dd4-5e7e3a632ac0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestActive", "RequestRelease"]

    /**
     * 
     * @returns {HRESULT} 
     */
    RequestActive() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RequestRelease() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
