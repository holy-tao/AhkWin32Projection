#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\WindowsUpdateManager.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsUpdateManagerFactory2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsUpdateManagerFactory2
     * @type {Guid}
     */
    static IID => Guid("{ba08d663-d160-59b9-9898-97a186ad52ea}")

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
     * @param {HSTRING} clientId 
     * @param {Integer} providerIdFilter_length 
     * @param {Pointer<HSTRING>} providerIdFilter 
     * @returns {WindowsUpdateManager} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(clientId, providerIdFilter_length, providerIdFilter) {
        if(clientId is String) {
            pin := HSTRING.Create(clientId)
            clientId := pin.Value
        }
        clientId := clientId is Win32Handle ? NumGet(clientId, "ptr") : clientId

        result := ComCall(6, this, "ptr", clientId, "uint", providerIdFilter_length, "ptr", providerIdFilter, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsUpdateManager(value)
    }
}
