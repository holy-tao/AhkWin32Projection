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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPackageTargetTypes", "GetPackageTarget", "Cancel"]

    /**
     * 
     * @param {Pointer<Integer>} targetCount 
     * @param {Pointer<Pointer<Guid>>} targetTypes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/documenttarget/nf-documenttarget-iprintdocumentpackagetarget-getpackagetargettypes
     */
    GetPackageTargetTypes(targetCount, targetTypes) {
        targetCountMarshal := targetCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, targetCountMarshal, targetCount, "ptr*", targetTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidTargetType 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/documenttarget/nf-documenttarget-iprintdocumentpackagetarget-getpackagetarget
     */
    GetPackageTarget(guidTargetType, riid, ppvTarget) {
        result := ComCall(4, this, "ptr", guidTargetType, "ptr", riid, "ptr*", ppvTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/documenttarget/nf-documenttarget-iprintdocumentpackagetarget-cancel
     */
    Cancel() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
