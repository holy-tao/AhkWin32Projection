#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DeploymentWorkload.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Setup
 * @version WindowsRuntime 1.4
 */
class IDeploymentWorkloadFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeploymentWorkloadFactory
     * @type {Guid}
     */
    static IID => Guid("{41426c72-22a3-5339-bdf1-51268169aa61}")

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
     * @param {HSTRING} id 
     * @returns {DeploymentWorkload} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(6, this, "ptr", id, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeploymentWorkload(value)
    }
}
