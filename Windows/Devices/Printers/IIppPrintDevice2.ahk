#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PdlPassthroughProvider.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IIppPrintDevice2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIppPrintDevice2
     * @type {Guid}
     */
    static IID => Guid("{f7c844c9-9d21-5c63-ac20-3676915be2d7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMaxSupportedPdfSize", "GetMaxSupportedPdfVersion", "IsPdlPassthroughSupported", "GetPdlPassthroughProvider"]

    /**
     * 
     * @returns {Integer} 
     */
    GetMaxSupportedPdfSize() {
        result := ComCall(6, this, "uint*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetMaxSupportedPdfVersion() {
        result_ := HSTRING()
        result := ComCall(7, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} pdlContentType 
     * @returns {Boolean} 
     */
    IsPdlPassthroughSupported(pdlContentType) {
        if(pdlContentType is String) {
            pin := HSTRING.Create(pdlContentType)
            pdlContentType := pin.Value
        }
        pdlContentType := pdlContentType is Win32Handle ? NumGet(pdlContentType, "ptr") : pdlContentType

        result := ComCall(8, this, "ptr", pdlContentType, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {PdlPassthroughProvider} 
     */
    GetPdlPassthroughProvider() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PdlPassthroughProvider(result_)
    }
}
