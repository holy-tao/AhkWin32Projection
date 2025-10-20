#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Integer>} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspaces-get_count
     */
    get_Count(Count) {
        result := ComCall(7, this, "int*", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVARIANT>} NewEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspaces-get__newenum
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
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspaces-get_item
     */
    get_Item(varIndex, TuningSpace) {
        result := ComCall(9, this, "ptr", varIndex, "ptr*", TuningSpace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumTuningSpaces>} NewEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituningspaces-get_enumtuningspaces
     */
    get_EnumTuningSpaces(NewEnum) {
        result := ComCall(10, this, "ptr*", NewEnum, "HRESULT")
        return result
    }
}
