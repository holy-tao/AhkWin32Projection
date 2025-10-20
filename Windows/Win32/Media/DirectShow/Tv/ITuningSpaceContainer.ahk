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
     * 
     * @param {Pointer<Int32>} Count 
     * @returns {HRESULT} 
     */
    get_Count(Count) {
        result := ComCall(7, this, "int*", Count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVARIANT>} NewEnum 
     * @returns {HRESULT} 
     */
    get__NewEnum(NewEnum) {
        result := ComCall(8, this, "ptr", NewEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @param {Pointer<ITuningSpace>} TuningSpace 
     * @returns {HRESULT} 
     */
    get_Item(varIndex, TuningSpace) {
        result := ComCall(9, this, "ptr", varIndex, "ptr", TuningSpace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @param {Pointer<ITuningSpace>} TuningSpace 
     * @returns {HRESULT} 
     */
    put_Item(varIndex, TuningSpace) {
        result := ComCall(10, this, "ptr", varIndex, "ptr", TuningSpace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} SpaceCLSID 
     * @param {Pointer<ITuningSpaces>} NewColl 
     * @returns {HRESULT} 
     */
    TuningSpacesForCLSID(SpaceCLSID, NewColl) {
        SpaceCLSID := SpaceCLSID is String ? BSTR.Alloc(SpaceCLSID).Value : SpaceCLSID

        result := ComCall(11, this, "ptr", SpaceCLSID, "ptr", NewColl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} SpaceCLSID 
     * @param {Pointer<ITuningSpaces>} NewColl 
     * @returns {HRESULT} 
     */
    _TuningSpacesForCLSID2(SpaceCLSID, NewColl) {
        result := ComCall(12, this, "ptr", SpaceCLSID, "ptr", NewColl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Name 
     * @param {Pointer<ITuningSpaces>} NewColl 
     * @returns {HRESULT} 
     */
    TuningSpacesForName(Name, NewColl) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(13, this, "ptr", Name, "ptr", NewColl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITuningSpace>} TuningSpace 
     * @param {Pointer<Int32>} ID 
     * @returns {HRESULT} 
     */
    FindID(TuningSpace, ID) {
        result := ComCall(14, this, "ptr", TuningSpace, "int*", ID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITuningSpace>} TuningSpace 
     * @param {Pointer<VARIANT>} NewIndex 
     * @returns {HRESULT} 
     */
    Add(TuningSpace, NewIndex) {
        result := ComCall(15, this, "ptr", TuningSpace, "ptr", NewIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumTuningSpaces>} ppEnum 
     * @returns {HRESULT} 
     */
    get_EnumTuningSpaces(ppEnum) {
        result := ComCall(16, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @returns {HRESULT} 
     */
    Remove(Index) {
        result := ComCall(17, this, "ptr", Index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} MaxCount 
     * @returns {HRESULT} 
     */
    get_MaxCount(MaxCount) {
        result := ComCall(18, this, "int*", MaxCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} MaxCount 
     * @returns {HRESULT} 
     */
    put_MaxCount(MaxCount) {
        result := ComCall(19, this, "int", MaxCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
