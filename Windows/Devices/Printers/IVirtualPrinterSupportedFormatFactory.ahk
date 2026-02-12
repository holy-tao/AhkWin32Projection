#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\VirtualPrinterSupportedFormat.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IVirtualPrinterSupportedFormatFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVirtualPrinterSupportedFormatFactory
     * @type {Guid}
     */
    static IID => Guid("{6daaed44-97a6-57f4-be8b-9dbabc587f2d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {HSTRING} contentType 
     * @param {HSTRING} maxSupportedVersion 
     * @returns {VirtualPrinterSupportedFormat} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(contentType, maxSupportedVersion) {
        if(contentType is String) {
            pin := HSTRING.Create(contentType)
            contentType := pin.Value
        }
        contentType := contentType is Win32Handle ? NumGet(contentType, "ptr") : contentType
        if(maxSupportedVersion is String) {
            pin := HSTRING.Create(maxSupportedVersion)
            maxSupportedVersion := pin.Value
        }
        maxSupportedVersion := maxSupportedVersion is Win32Handle ? NumGet(maxSupportedVersion, "ptr") : maxSupportedVersion

        result := ComCall(6, this, "ptr", contentType, "ptr", maxSupportedVersion, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VirtualPrinterSupportedFormat(value)
    }
}
