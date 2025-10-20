#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IDebugPropertyEnumType_All extends IUnknown{
    /**
     * The interface identifier for IDebugPropertyEnumType_All
     * @type {Guid}
     */
    static IID => Guid("{51973c55-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BSTR>} __MIDL__IDebugPropertyEnumType_All0000 
     * @returns {HRESULT} 
     */
    GetName(__MIDL__IDebugPropertyEnumType_All0000) {
        result := ComCall(3, this, "ptr", __MIDL__IDebugPropertyEnumType_All0000, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
