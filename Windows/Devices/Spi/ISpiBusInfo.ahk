#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Spi
 * @version WindowsRuntime 1.4
 */
class ISpiBusInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpiBusInfo
     * @type {Guid}
     */
    static IID => Guid("{9929444a-54f2-48c6-b952-9c32fc02c669}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChipSelectLineCount", "get_MinClockFrequency", "get_MaxClockFrequency", "get_SupportedDataBitLengths"]

    /**
     * @type {Integer} 
     */
    ChipSelectLineCount {
        get => this.get_ChipSelectLineCount()
    }

    /**
     * @type {Integer} 
     */
    MinClockFrequency {
        get => this.get_MinClockFrequency()
    }

    /**
     * @type {Integer} 
     */
    MaxClockFrequency {
        get => this.get_MaxClockFrequency()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedDataBitLengths {
        get => this.get_SupportedDataBitLengths()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChipSelectLineCount() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinClockFrequency() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxClockFrequency() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedDataBitLengths() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }
}
