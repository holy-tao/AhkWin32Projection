#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IScriptInvocationContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScriptInvocationContext
     * @type {Guid}
     */
    static IID => Guid("{5d7741b7-af7e-4a2a-85e5-c77f4d0659fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetContextType", "GetContextDescription", "GetContextObject"]

    /**
     * 
     * @returns {Integer} 
     */
    GetContextType() {
        result := ComCall(3, this, "int*", &pInvocationContextType := 0, "HRESULT")
        return pInvocationContextType
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetContextDescription() {
        pDescription := BSTR()
        result := ComCall(4, this, "ptr", pDescription, "HRESULT")
        return pDescription
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    GetContextObject() {
        result := ComCall(5, this, "ptr*", &ppContextObject := 0, "HRESULT")
        return IUnknown(ppContextObject)
    }
}
