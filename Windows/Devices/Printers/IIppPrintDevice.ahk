#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Foundation\Collections\IMap.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\IppAttributeValue.ahk
#Include .\IppSetAttributesResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IIppPrintDevice extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIppPrintDevice
     * @type {Guid}
     */
    static IID => Guid("{d748ac56-76f3-5dc6-afd4-c2a8686b9359}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PrinterName", "get_PrinterUri", "GetPrinterAttributesAsBuffer", "GetPrinterAttributes", "SetPrinterAttributesFromBuffer", "SetPrinterAttributes"]

    /**
     * @type {HSTRING} 
     */
    PrinterName {
        get => this.get_PrinterName()
    }

    /**
     * @type {Uri} 
     */
    PrinterUri {
        get => this.get_PrinterUri()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PrinterName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_PrinterUri() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} attributeNames 
     * @returns {IBuffer} 
     */
    GetPrinterAttributesAsBuffer(attributeNames) {
        result := ComCall(8, this, "ptr", attributeNames, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(result_)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} attributeNames 
     * @returns {IMap<HSTRING, IppAttributeValue>} 
     */
    GetPrinterAttributes(attributeNames) {
        result := ComCall(9, this, "ptr", attributeNames, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => HSTRING({ Value: ptr }), IppAttributeValue, result_)
    }

    /**
     * 
     * @param {IBuffer} printerAttributesBuffer 
     * @returns {IppSetAttributesResult} 
     */
    SetPrinterAttributesFromBuffer(printerAttributesBuffer) {
        result := ComCall(10, this, "ptr", printerAttributesBuffer, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppSetAttributesResult(result_)
    }

    /**
     * 
     * @param {IIterable<IKeyValuePair<HSTRING, IppAttributeValue>>} printerAttributes 
     * @returns {IppSetAttributesResult} 
     */
    SetPrinterAttributes(printerAttributes) {
        result := ComCall(11, this, "ptr", printerAttributes, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppSetAttributesResult(result_)
    }
}
