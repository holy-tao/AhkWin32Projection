#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AppCaptureRecordOperation.ahk
#Include .\AppCaptureState.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppCaptureServices extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppCaptureServices
     * @type {Guid}
     */
    static IID => Guid("{44fec0b5-34f5-4f18-ae8c-b9123abbfc0d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Record", "RecordTimeSpan", "get_CanCapture", "get_State"]

    /**
     * @type {Boolean} 
     */
    CanCapture {
        get => this.get_CanCapture()
    }

    /**
     * @type {AppCaptureState} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Learn the details of the XML Bulk Load record generation process in SQLXML 4.0.
     * @returns {AppCaptureRecordOperation} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/sqlxml-annotated-xsd-schemas-xpath-queries/bulk-load-xml/record-generation-process-sqlxml-4-0
     */
    Record() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppCaptureRecordOperation(operation)
    }

    /**
     * 
     * @param {DateTime} startTime 
     * @param {TimeSpan} duration_ 
     * @returns {AppCaptureRecordOperation} 
     */
    RecordTimeSpan(startTime, duration_) {
        result := ComCall(7, this, "ptr", startTime, "ptr", duration_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppCaptureRecordOperation(operation)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanCapture() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {AppCaptureState} 
     */
    get_State() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppCaptureState(value)
    }
}
