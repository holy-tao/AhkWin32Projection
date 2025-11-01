#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @remarks
 * 
  * Creating the InkCollector control behind a transparent control (such as a GroupBox with the WS_EX_TRANSPARENT property set) will prevent InkCollector from collecting ink.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinktablets
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkTablets extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkTablets
     * @type {Guid}
     */
    static IID => Guid("{112086d9-7779-4535-a699-862b43ac1863}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "get_DefaultTablet", "Item", "IsPacketPropertySupported"]

    /**
     * 
     * @param {Pointer<Integer>} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktablets-get_count
     */
    get_Count(Count) {
        CountMarshal := Count is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, CountMarshal, Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} _NewEnum 
     * @returns {HRESULT} 
     */
    get__NewEnum(_NewEnum) {
        result := ComCall(8, this, "ptr*", _NewEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInkTablet>} DefaultTablet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktablets-get_defaulttablet
     */
    get_DefaultTablet(DefaultTablet) {
        result := ComCall(9, this, "ptr*", DefaultTablet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<IInkTablet>} Tablet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktablets-item
     */
    Item(Index, Tablet) {
        result := ComCall(10, this, "int", Index, "ptr*", Tablet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} packetPropertyName 
     * @param {Pointer<VARIANT_BOOL>} Supported 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktablets-ispacketpropertysupported
     */
    IsPacketPropertySupported(packetPropertyName, Supported) {
        packetPropertyName := packetPropertyName is String ? BSTR.Alloc(packetPropertyName).Value : packetPropertyName

        result := ComCall(11, this, "ptr", packetPropertyName, "ptr", Supported, "HRESULT")
        return result
    }
}
