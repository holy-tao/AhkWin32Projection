#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\UpdateTaskResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class IUpdateTaskResultFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateTaskResultFactory
     * @type {Guid}
     */
    static IID => Guid("{c5ae4ce3-7d1e-50bf-a64a-95f34783fc8c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance", "CreateInstance2"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {Boolean} succeeded 
     * @param {HSTRING} reason 
     * @returns {UpdateTaskResult} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(succeeded, reason) {
        if(reason is String) {
            pin := HSTRING.Create(reason)
            reason := pin.Value
        }
        reason := reason is Win32Handle ? NumGet(reason, "ptr") : reason

        result := ComCall(6, this, "int", succeeded, "ptr", reason, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdateTaskResult(value)
    }

    /**
     * 
     * @param {Boolean} succeeded 
     * @param {HSTRING} reason 
     * @param {Integer} errorCode 
     * @returns {UpdateTaskResult} 
     */
    CreateInstance2(succeeded, reason, errorCode) {
        if(reason is String) {
            pin := HSTRING.Create(reason)
            reason := pin.Value
        }
        reason := reason is Win32Handle ? NumGet(reason, "ptr") : reason

        result := ComCall(7, this, "int", succeeded, "ptr", reason, "int", errorCode, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdateTaskResult(value)
    }
}
