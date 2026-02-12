#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BarcodeScannerReport.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IBarcodeScannerReportFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBarcodeScannerReportFactory
     * @type {Guid}
     */
    static IID => Guid("{a2547326-2013-457c-8963-49c15dca78ce}")

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
     * @param {Integer} scanDataType 
     * @param {IBuffer} scanData 
     * @param {IBuffer} scanDataLabel 
     * @returns {BarcodeScannerReport} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(scanDataType, scanData, scanDataLabel) {
        result := ComCall(6, this, "uint", scanDataType, "ptr", scanData, "ptr", scanDataLabel, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BarcodeScannerReport(result_)
    }
}
