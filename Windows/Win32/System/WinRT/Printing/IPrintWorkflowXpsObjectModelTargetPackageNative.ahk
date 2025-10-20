#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Printing
 * @version v4.0.30319
 */
class IPrintWorkflowXpsObjectModelTargetPackageNative extends IUnknown{
    /**
     * The interface identifier for IPrintWorkflowXpsObjectModelTargetPackageNative
     * @type {Guid}
     */
    static IID => Guid("{7d96bc74-9b54-4ca1-ad3a-979c3d44ddac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IXpsDocumentPackageTarget>} value 
     * @returns {HRESULT} 
     */
    get_DocumentPackageTarget(value) {
        result := ComCall(3, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
