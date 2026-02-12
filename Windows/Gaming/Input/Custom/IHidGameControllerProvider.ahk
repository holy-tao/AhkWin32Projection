#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Input.Custom
 * @version WindowsRuntime 1.4
 */
class IHidGameControllerProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHidGameControllerProvider
     * @type {Guid}
     */
    static IID => Guid("{95ce3af4-abf0-4b68-a081-3b7de73ff0e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UsageId", "get_UsagePage", "GetFeatureReport", "SendFeatureReport", "SendOutputReport"]

    /**
     * @type {Integer} 
     */
    UsageId {
        get => this.get_UsageId()
    }

    /**
     * @type {Integer} 
     */
    UsagePage {
        get => this.get_UsagePage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsageId() {
        result := ComCall(6, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsagePage() {
        result := ComCall(7, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} reportId 
     * @param {Pointer<Integer>} reportBuffer_length 
     * @param {Pointer<Pointer<Integer>>} reportBuffer 
     * @returns {HRESULT} 
     */
    GetFeatureReport(reportId, reportBuffer_length, reportBuffer) {
        reportBuffer_lengthMarshal := reportBuffer_length is VarRef ? "uint*" : "ptr"
        reportBufferMarshal := reportBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "char", reportId, reportBuffer_lengthMarshal, reportBuffer_length, reportBufferMarshal, reportBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} reportId 
     * @param {Integer} reportBuffer_length 
     * @param {Pointer<Integer>} reportBuffer 
     * @returns {HRESULT} 
     */
    SendFeatureReport(reportId, reportBuffer_length, reportBuffer) {
        reportBufferMarshal := reportBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "char", reportId, "uint", reportBuffer_length, reportBufferMarshal, reportBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} reportId 
     * @param {Integer} reportBuffer_length 
     * @param {Pointer<Integer>} reportBuffer 
     * @returns {HRESULT} 
     */
    SendOutputReport(reportId, reportBuffer_length, reportBuffer) {
        reportBufferMarshal := reportBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, "char", reportId, "uint", reportBuffer_length, reportBufferMarshal, reportBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
