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
     * @param {Pointer<IUnknown>} _NewEnum 
     * @returns {HRESULT} 
     */
    get__NewEnum(_NewEnum) {
        result := ComCall(8, this, "ptr", _NewEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkTablet>} DefaultTablet 
     * @returns {HRESULT} 
     */
    get_DefaultTablet(DefaultTablet) {
        result := ComCall(9, this, "ptr", DefaultTablet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<IInkTablet>} Tablet 
     * @returns {HRESULT} 
     */
    Item(Index, Tablet) {
        result := ComCall(10, this, "int", Index, "ptr", Tablet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} packetPropertyName 
     * @param {Pointer<VARIANT_BOOL>} Supported 
     * @returns {HRESULT} 
     */
    IsPacketPropertySupported(packetPropertyName, Supported) {
        packetPropertyName := packetPropertyName is String ? BSTR.Alloc(packetPropertyName).Value : packetPropertyName

        result := ComCall(11, this, "ptr", packetPropertyName, "ptr", Supported, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
