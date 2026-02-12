#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDxcOperationResult.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcLinker extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDxcLinker
     * @type {Guid}
     */
    static IID => Guid("{f1b5be2a-62dd-4327-a1c2-42ac1e1e78e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterLibrary", "Link"]

    /**
     * 
     * @param {PWSTR} pLibName 
     * @param {IDxcBlob} pLib 
     * @returns {HRESULT} 
     */
    RegisterLibrary(pLibName, pLib) {
        pLibName := pLibName is String ? StrPtr(pLibName) : pLibName

        result := ComCall(3, this, "ptr", pLibName, "ptr", pLib, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * These methods add linked items to a database, get the name of an item for a linked item, get items linked to an item, and set a catalog item for a linked item.
     * @param {PWSTR} pEntryName 
     * @param {PWSTR} pTargetProfile 
     * @param {Pointer<PWSTR>} pLibNames 
     * @param {Integer} libCount 
     * @param {Pointer<PWSTR>} pArguments 
     * @param {Integer} argCount 
     * @returns {Pointer<IDxcOperationResult>} 
     * @see https://learn.microsoft.com/sql/ocs/docs/reporting-services/report-server-web-service/methods/linked-reports-methods
     */
    Link(pEntryName, pTargetProfile, pLibNames, libCount, pArguments, argCount) {
        pEntryName := pEntryName is String ? StrPtr(pEntryName) : pEntryName
        pTargetProfile := pTargetProfile is String ? StrPtr(pTargetProfile) : pTargetProfile

        pLibNamesMarshal := pLibNames is VarRef ? "ptr*" : "ptr"
        pArgumentsMarshal := pArguments is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pEntryName, "ptr", pTargetProfile, pLibNamesMarshal, pLibNames, "uint", libCount, pArgumentsMarshal, pArguments, "uint", argCount, "ptr*", &ppResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppResult
    }
}
