#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Ole\IEnumVARIANT.ahk
#Include .\ITuningSpace.ahk
#Include .\IEnumTuningSpaces.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The ITuningSpaces interface represents a collection of tuning spaces.
 * @remarks
 * 
 * This interface is used to enumerate subsets of tuning spaces within the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/systemtuningspaces-object">SystemTuningSpaces</a> object. To enumerate all of the tuning spaces available on the system, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ituningspacecontainer">ITuningSpaceContainer</a> interface on the SystemTuningSpaces object.
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ITuningSpaces)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ituningspaces
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ITuningSpaces extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITuningSpaces
     * @type {Guid}
     */
    static IID => Guid("{901284e4-33fe-4b69-8d63-634a596f3756}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "get_Item", "get_EnumTuningSpaces"]

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
     * The get_Count method returns the number of tuning spaces in the collection.
     * @returns {Integer} Pointer to a variable that receives the number of items in the collection.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspaces-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * The get__NewEnum method returns an enumerator for the collection.
     * @returns {IEnumVARIANT} Pointer to a variable that receives an <b>IEnumVARIANT</b> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspaces-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &NewEnum := 0, "HRESULT")
        return IEnumVARIANT(NewEnum)
    }

    /**
     * The get_Item method returns the specified item in the collection.
     * @param {VARIANT} varIndex <b>VARIANT</b> type that specifies the ID of the tuning space. The ID uniquely identifies the tuning space within the <b>SystemTuningSpaces</b> object.
     * @returns {ITuningSpace} Address of a variable that receives a pointer to the tuning space's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ituningspace">ITuningSpace</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspaces-get_item
     */
    get_Item(varIndex) {
        result := ComCall(9, this, "ptr", varIndex, "ptr*", &TuningSpace := 0, "HRESULT")
        return ITuningSpace(TuningSpace)
    }

    /**
     * The get_EnumTuningSpaces method returns an enumerator for the collection.
     * @returns {IEnumTuningSpaces} Pointer to a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ienumtuningspaces">IEnumTuningSpaces</a> interface pointer. Use this interface to iterate through the collection. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituningspaces-get_enumtuningspaces
     */
    get_EnumTuningSpaces() {
        result := ComCall(10, this, "ptr*", &NewEnum := 0, "HRESULT")
        return IEnumTuningSpaces(NewEnum)
    }
}
