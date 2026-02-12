#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IPosPrinterFontProperty extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPosPrinterFontProperty
     * @type {Guid}
     */
    static IID => Guid("{a7f4e93a-f8ac-5f04-84d2-29b16d8a633c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TypeFace", "get_IsScalableToAnySize", "get_CharacterSizes"]

    /**
     * @type {HSTRING} 
     */
    TypeFace {
        get => this.get_TypeFace()
    }

    /**
     * @type {Boolean} 
     */
    IsScalableToAnySize {
        get => this.get_IsScalableToAnySize()
    }

    /**
     * @type {IVectorView<SizeUInt32>} 
     */
    CharacterSizes {
        get => this.get_CharacterSizes()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TypeFace() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsScalableToAnySize() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<SizeUInt32>} 
     */
    get_CharacterSizes() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetSizeUInt32(), value)
    }
}
