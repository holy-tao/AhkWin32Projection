#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents actions common to jobs for all types of stations for a point-of-service printer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.iposprinterjob
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IPosPrinterJob extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPosPrinterJob
     * @type {Guid}
     */
    static IID => Guid("{9a94005c-0615-4591-a58f-30f87edfe2e4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Print", "PrintLine", "PrintNewline", "ExecuteAsync"]

    /**
     * Adds an instruction to the print job to print the specified text.
     * @remarks
     * If [ClaimedPosPrinter.IsCharacterSetMappingEnabled](claimedposprinter_ischaractersetmappingenabled.md) is true, the text is mapped to the font on the printer that [ClaimedPosPrinter.CharacterSet](claimedposprinter_characterset.md) specifies. If [ClaimedPosPrinter.IsCharacterSetMappingEnabled](claimedposprinter_ischaractersetmappingenabled.md) is false, the driver or provider sends the low byte of each Unicode character to the printer verbatim.
     * @param {HSTRING} data The text to print on the point-of-service printer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.iposprinterjob.print
     */
    Print(data) {
        if(data is String) {
            pin := HSTRING.Create(data)
            data := pin.Value
        }
        data := data is Win32Handle ? NumGet(data, "ptr") : data

        result := ComCall(6, this, "ptr", data, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds an instruction to the print job to print the specified line of text.
     * @param {HSTRING} data The line of text to print.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.iposprinterjob.printline
     */
    PrintLine(data) {
        if(data is String) {
            pin := HSTRING.Create(data)
            data := pin.Value
        }
        data := data is Win32Handle ? NumGet(data, "ptr") : data

        result := ComCall(7, this, "ptr", data, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds an instruction to the print job to print a newline character.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.iposprinterjob.printline
     */
    PrintNewline() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Runs the print job on the printer station asynchronously.
     * @remarks
     * The print job is sent to the claimed printer station object that created the print job.
     * The claimed printer station object must remain valid when calling this method.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.iposprinterjob.executeasync
     */
    ExecuteAsync() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
