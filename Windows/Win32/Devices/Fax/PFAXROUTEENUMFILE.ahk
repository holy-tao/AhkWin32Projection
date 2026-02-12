#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The FaxRouteEnumFile callback function receives the file names in the fax file list associated with a received fax document.
 * @remarks
 * The fax routing extension DLL must register the <i>FaxRouteEnumFile</i> callback function by passing its address to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxroute/nc-faxroute-pfaxrouteenumfiles">FaxRouteEnumFiles</a> function.
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-file-lists">Fax File Lists</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/faxroute/nc-faxroute-pfaxrouteenumfile
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class PFAXROUTEENUMFILE extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Integer} JobId 
     * @param {Pointer<Guid>} GuidOwner 
     * @param {Pointer<Guid>} GuidCaller 
     * @param {PWSTR} FileName 
     * @param {Pointer<Void>} Context_ 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(JobId, GuidOwner, GuidCaller, FileName, Context_) {
        FileName := FileName is String ? StrPtr(FileName) : FileName

        Context_Marshal := Context_ is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "uint", JobId, "ptr", GuidOwner, "ptr", GuidCaller, "ptr", FileName, Context_Marshal, Context_, "int")
        return result
    }
}
