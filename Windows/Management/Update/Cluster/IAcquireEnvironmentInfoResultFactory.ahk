#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\AcquireEnvironmentInfoResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class IAcquireEnvironmentInfoResultFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAcquireEnvironmentInfoResultFactory
     * @type {Guid}
     */
    static IID => Guid("{bbe87f45-0125-5b6d-b9de-05effc98becb}")

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
     * @param {UpdateTaskResult} result_ 
     * @param {HSTRING} environmentInfo 
     * @returns {AcquireEnvironmentInfoResult} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(result_, environmentInfo) {
        if(environmentInfo is String) {
            pin := HSTRING.Create(environmentInfo)
            environmentInfo := pin.Value
        }
        environmentInfo := environmentInfo is Win32Handle ? NumGet(environmentInfo, "ptr") : environmentInfo

        result := ComCall(6, this, "ptr", result_, "ptr", environmentInfo, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AcquireEnvironmentInfoResult(value)
    }
}
