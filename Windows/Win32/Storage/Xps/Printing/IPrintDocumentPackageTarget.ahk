#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Allows users to enumerate the supported package target types and to create one with a given type ID. IPrintDocumentPackageTarget also supports the tracking of the package printing progress and cancelling.
 * @see https://docs.microsoft.com/windows/win32/api//documenttarget/nn-documenttarget-iprintdocumentpackagetarget
 * @namespace Windows.Win32.Storage.Xps.Printing
 * @version v4.0.30319
 */
class IPrintDocumentPackageTarget extends IUnknown{
    /**
     * The interface identifier for IPrintDocumentPackageTarget
     * @type {Guid}
     */
    static IID => Guid("{1b8efec4-3019-4c27-964e-367202156906}")

    /**
     * The class identifier for PrintDocumentPackageTarget
     * @type {Guid}
     */
    static CLSID => Guid("{4842669e-9947-46ea-8ba2-d8cce432c2ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} targetCount 
     * @param {Pointer<Guid>} targetTypes 
     * @returns {HRESULT} 
     */
    GetPackageTargetTypes(targetCount, targetTypes) {
        result := ComCall(3, this, "uint*", targetCount, "ptr", targetTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidTargetType 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvTarget 
     * @returns {HRESULT} 
     */
    GetPackageTarget(guidTargetType, riid, ppvTarget) {
        result := ComCall(4, this, "ptr", guidTargetType, "ptr", riid, "ptr", ppvTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
