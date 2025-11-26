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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspacecontainer-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @returns {IEnumVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspacecontainer-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &NewEnum := 0, "HRESULT")
        return IEnumVARIANT(NewEnum)
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @returns {ITuningSpace} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspacecontainer-get_item
     */
    get_Item(varIndex) {
        result := ComCall(9, this, "ptr", varIndex, "ptr*", &TuningSpace := 0, "HRESULT")
        return ITuningSpace(TuningSpace)
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
     * @returns {ITuningSpaces} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspacecontainer-tuningspacesforclsid
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
     * 
     * @param {BSTR} Name 
     * @returns {ITuningSpaces} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspacecontainer-tuningspacesforname
     */
    TuningSpacesForName(Name) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(13, this, "ptr", Name, "ptr*", &NewColl := 0, "HRESULT")
        return ITuningSpaces(NewColl)
    }

    /**
     * 
     * @param {ITuningSpace} TuningSpace 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspacecontainer-findid
     */
    FindID(TuningSpace) {
        result := ComCall(14, this, "ptr", TuningSpace, "int*", &ID := 0, "HRESULT")
        return ID
    }

    /**
     * 
     * @param {ITuningSpace} TuningSpace 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspacecontainer-add
     */
    Add(TuningSpace) {
        NewIndex := VARIANT()
        result := ComCall(15, this, "ptr", TuningSpace, "ptr", NewIndex, "HRESULT")
        return NewIndex
    }

    /**
     * 
     * @returns {IEnumTuningSpaces} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspacecontainer-get_enumtuningspaces
     */
    get_EnumTuningSpaces() {
        result := ComCall(16, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTuningSpaces(ppEnum)
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspacecontainer-get_maxcount
     */
    get_MaxCount() {
        result := ComCall(18, this, "int*", &MaxCount := 0, "HRESULT")
        return MaxCount
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
