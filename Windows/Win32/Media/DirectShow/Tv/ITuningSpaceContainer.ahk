#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Ole\IEnumVARIANT.ahk
#Include .\ITuningSpace.ahk
#Include .\ITuningSpaces.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include .\IEnumTuningSpaces.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The ITuningSpaceContainer interface is implemented on the SystemTuningSpaces object.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ITuningSpaceContainer)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ituningspacecontainer
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ITuningSpaceContainer extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITuningSpaceContainer
     * @type {Guid}
     */
    static IID => Guid("{5b692e84-e2f1-11d2-9493-00c04f72d980}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "get_Item", "put_Item", "TuningSpacesForCLSID", "_TuningSpacesForCLSID2", "TuningSpacesForName", "FindID", "Add", "get_EnumTuningSpaces", "Remove", "get_MaxCount", "put_MaxCount"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IEnumVARIANT} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {IEnumTuningSpaces} 
     */
    EnumTuningSpaces {
        get => this.get_EnumTuningSpaces()
    }

    /**
     * @type {Integer} 
     */
    MaxCount {
        get => this.get_MaxCount()
        set => this.put_MaxCount(value)
    }

    /**
     * The get_Count method retrieves the number of tuning spaces currently available on the local system.
     * @returns {Integer} Pointer to a variable receives the number of tuning spaces.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspacecontainer-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * The get__NewEnum method supports For...Each loops in Automation clients.
     * @returns {IEnumVARIANT} Pointer to a variable that receives an <b>IEnumVARIANT</b> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspacecontainer-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &NewEnum := 0, "HRESULT")
        return IEnumVARIANT(NewEnum)
    }

    /**
     * The get_Item method retrieves a tuning space with the specified ID.
     * @param {VARIANT} varIndex <b>VARIANT</b> that specifies the ID of the tuning space.
     * @returns {ITuningSpace} Address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ituningspace">ITuningSpace</a> interface pointer that will be set to the returned interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspacecontainer-get_item
     */
    get_Item(varIndex) {
        result := ComCall(9, this, "ptr", varIndex, "ptr*", &TuningSpace := 0, "HRESULT")
        return ITuningSpace(TuningSpace)
    }

    /**
     * The put_Item method saves changes to an existing tuning space in the collection.
     * @param {VARIANT} varIndex <b>VARIANT</b> that specifies the index of the tuning space.
     * @param {ITuningSpace} TuningSpace Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ituningspace">ITuningSpace</a> interface of the tuning space.
     * @returns {HRESULT} Returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NULL pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspacecontainer-put_item
     */
    put_Item(varIndex, TuningSpace) {
        result := ComCall(10, this, "ptr", varIndex, "ptr", TuningSpace, "HRESULT")
        return result
    }

    /**
     * The TuningSpacesForCLSID method retrieves a collection of tuning spaces that match the specified CLSID.This method is intended for Automation clients, because it returns the CLSID as a BSTR.
     * @param {BSTR} SpaceCLSID String representation of the CLSID of the tuning space.
     * @returns {ITuningSpaces} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ituningspaces">ITuningSpaces</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspacecontainer-tuningspacesforclsid
     */
    TuningSpacesForCLSID(SpaceCLSID) {
        SpaceCLSID := SpaceCLSID is String ? BSTR.Alloc(SpaceCLSID).Value : SpaceCLSID

        result := ComCall(11, this, "ptr", SpaceCLSID, "ptr*", &NewColl := 0, "HRESULT")
        return ITuningSpaces(NewColl)
    }

    /**
     * 
     * @param {Pointer<Guid>} SpaceCLSID 
     * @returns {ITuningSpaces} 
     */
    _TuningSpacesForCLSID2(SpaceCLSID) {
        result := ComCall(12, this, "ptr", SpaceCLSID, "ptr*", &NewColl := 0, "HRESULT")
        return ITuningSpaces(NewColl)
    }

    /**
     * The TuningSpacesForName method retrieves a collection of tuning spaces that match the specified name.
     * @param {BSTR} Name String that contains a regular expression to match against either the friendly name or the unique name of the tuning space.
     * @returns {ITuningSpaces} Address of variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ituningspaces">ITuningSpaces</a> interface pointer. Use this interface to enumerate the collection. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspacecontainer-tuningspacesforname
     */
    TuningSpacesForName(Name) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(13, this, "ptr", Name, "ptr*", &NewColl := 0, "HRESULT")
        return ITuningSpaces(NewColl)
    }

    /**
     * The FindID method retrieves the ID of a specified tuning space within the collection.
     * @param {ITuningSpace} TuningSpace Pointer to the <b>ITuningSpace</b> interface of the tuning space.
     * @returns {Integer} Pointer to a variable that receives the ID of the tuning space. The returned value is specific to this collection object (which represents the local system).
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspacecontainer-findid
     */
    FindID(TuningSpace) {
        result := ComCall(14, this, "ptr", TuningSpace, "int*", &ID := 0, "HRESULT")
        return ID
    }

    /**
     * The Add method adds a new persistent tuning space to the system.
     * @param {ITuningSpace} TuningSpace Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ituningspace">ITuningSpace</a> interface of the new tuning space
     * @returns {VARIANT} Pointer to a variable of type <b>VARIANT</b> that receives the ID of the new tuning space within the current collection.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspacecontainer-add
     */
    Add(TuningSpace) {
        NewIndex := VARIANT()
        result := ComCall(15, this, "ptr", TuningSpace, "ptr", NewIndex, "HRESULT")
        return NewIndex
    }

    /**
     * The get_EnumTuningSpaces method retrieves a collection of all tuning spaces available on the local system.
     * @returns {IEnumTuningSpaces} Pointer to a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ienumtuningspaces">IEnumTuningSpaces</a> interface pointer. Use this interface to enumerate the collection. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspacecontainer-get_enumtuningspaces
     */
    get_EnumTuningSpaces() {
        result := ComCall(16, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTuningSpaces(ppEnum)
    }

    /**
     * The Remove method permanently removes a tuning space from the system.
     * @param {VARIANT} Index Variable of type <b>VARIANT</b> that specifies the ID of the tuning space to remove.
     * @returns {HRESULT} Returns S_OK if successful. If the specified tuning space was invalid or corrupted in the Registry, this method will delete whatever information is there and return S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspacecontainer-remove
     */
    Remove(Index) {
        result := ComCall(17, this, "ptr", Index, "HRESULT")
        return result
    }

    /**
     * The get_MaxCount method retrieves the maximum number of tuning spaces allowed on the system.
     * @returns {Integer} Pointer to a variable that receives the maximum number of tuning spaces.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspacecontainer-get_maxcount
     */
    get_MaxCount() {
        result := ComCall(18, this, "int*", &MaxCount := 0, "HRESULT")
        return MaxCount
    }

    /**
     * The put_MaxCount method sets the maximum number of tuning spaces allowed on the system.
     * @param {Integer} MaxCount Specifies the maximum number of tuning spaces.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspacecontainer-put_maxcount
     */
    put_MaxCount(MaxCount) {
        result := ComCall(19, this, "int", MaxCount, "HRESULT")
        return result
    }
}
