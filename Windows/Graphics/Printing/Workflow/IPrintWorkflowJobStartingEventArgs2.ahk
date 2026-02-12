#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class IPrintWorkflowJobStartingEventArgs2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWorkflowJobStartingEventArgs2
     * @type {Guid}
     */
    static IID => Guid("{7deded67-d3dc-5b23-8690-4ebfc0f0914a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsIppCompressionEnabled", "DisableIppCompressionForJob", "get_SkipSystemFaxUI", "put_SkipSystemFaxUI"]

    /**
     * @type {Boolean} 
     */
    IsIppCompressionEnabled {
        get => this.get_IsIppCompressionEnabled()
    }

    /**
     * @type {Boolean} 
     */
    SkipSystemFaxUI {
        get => this.get_SkipSystemFaxUI()
        set => this.put_SkipSystemFaxUI(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIppCompressionEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisableIppCompressionForJob() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SkipSystemFaxUI() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SkipSystemFaxUI(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
