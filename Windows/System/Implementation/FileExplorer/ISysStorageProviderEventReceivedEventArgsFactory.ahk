#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SysStorageProviderEventReceivedEventArgs.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Implementation.FileExplorer
 * @version WindowsRuntime 1.4
 */
class ISysStorageProviderEventReceivedEventArgsFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISysStorageProviderEventReceivedEventArgsFactory
     * @type {Guid}
     */
    static IID => Guid("{de1a780e-e975-5f68-bcc6-fb46281c6a61}")

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
     * @param {HSTRING} json 
     * @returns {SysStorageProviderEventReceivedEventArgs} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(json) {
        if(json is String) {
            pin := HSTRING.Create(json)
            json := pin.Value
        }
        json := json is Win32Handle ? NumGet(json, "ptr") : json

        result := ComCall(6, this, "ptr", json, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SysStorageProviderEventReceivedEventArgs(value)
    }
}
