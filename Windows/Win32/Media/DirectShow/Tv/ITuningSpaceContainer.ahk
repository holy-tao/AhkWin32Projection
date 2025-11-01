#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<Integer>} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspacecontainer-get_count
     */
    get_Count(Count) {
        CountMarshal := Count is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, CountMarshal, Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVARIANT>} NewEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspacecontainer-get__newenum
     */
    get__NewEnum(NewEnum) {
        result := ComCall(8, this, "ptr*", NewEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @param {Pointer<ITuningSpace>} TuningSpace 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspacecontainer-get_item
     */
    get_Item(varIndex, TuningSpace) {
        result := ComCall(9, this, "ptr", varIndex, "ptr*", TuningSpace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @param {ITuningSpace} TuningSpace 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspacecontainer-put_item
     */
    put_Item(varIndex, TuningSpace) {
        result := ComCall(10, this, "ptr", varIndex, "ptr", TuningSpace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} SpaceCLSID 
     * @param {Pointer<ITuningSpaces>} NewColl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspacecontainer-tuningspacesforclsid
     */
    TuningSpacesForCLSID(SpaceCLSID, NewColl) {
        SpaceCLSID := SpaceCLSID is String ? BSTR.Alloc(SpaceCLSID).Value : SpaceCLSID

        result := ComCall(11, this, "ptr", SpaceCLSID, "ptr*", NewColl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} SpaceCLSID 
     * @param {Pointer<ITuningSpaces>} NewColl 
     * @returns {HRESULT} 
     */
    _TuningSpacesForCLSID2(SpaceCLSID, NewColl) {
        result := ComCall(12, this, "ptr", SpaceCLSID, "ptr*", NewColl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Name 
     * @param {Pointer<ITuningSpaces>} NewColl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspacecontainer-tuningspacesforname
     */
    TuningSpacesForName(Name, NewColl) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(13, this, "ptr", Name, "ptr*", NewColl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITuningSpace} TuningSpace 
     * @param {Pointer<Integer>} ID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspacecontainer-findid
     */
    FindID(TuningSpace, ID) {
        IDMarshal := ID is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, "ptr", TuningSpace, IDMarshal, ID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITuningSpace} TuningSpace 
     * @param {Pointer<VARIANT>} NewIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspacecontainer-add
     */
    Add(TuningSpace, NewIndex) {
        result := ComCall(15, this, "ptr", TuningSpace, "ptr", NewIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumTuningSpaces>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspacecontainer-get_enumtuningspaces
     */
    get_EnumTuningSpaces(ppEnum) {
        result := ComCall(16, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspacecontainer-remove
     */
    Remove(Index) {
        result := ComCall(17, this, "ptr", Index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} MaxCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspacecontainer-get_maxcount
     */
    get_MaxCount(MaxCount) {
        MaxCountMarshal := MaxCount is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, MaxCountMarshal, MaxCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} MaxCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspacecontainer-put_maxcount
     */
    put_MaxCount(MaxCount) {
        result := ComCall(19, this, "int", MaxCount, "HRESULT")
        return result
    }
}
