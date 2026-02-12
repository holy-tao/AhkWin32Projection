#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class IPrintWorkflowConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWorkflowConfiguration
     * @type {Guid}
     */
    static IID => Guid("{d0aac4ed-fd4b-5df5-4bb6-8d0d159ebe3f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourceAppDisplayName", "get_JobTitle", "get_SessionId"]

    /**
     * @type {HSTRING} 
     */
    SourceAppDisplayName {
        get => this.get_SourceAppDisplayName()
    }

    /**
     * @type {HSTRING} 
     */
    JobTitle {
        get => this.get_JobTitle()
    }

    /**
     * @type {HSTRING} 
     */
    SessionId {
        get => this.get_SessionId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourceAppDisplayName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_JobTitle() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SessionId() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
