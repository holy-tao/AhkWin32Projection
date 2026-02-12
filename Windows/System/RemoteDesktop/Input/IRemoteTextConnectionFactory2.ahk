#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\RemoteTextConnection.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteDesktop.Input
 * @version WindowsRuntime 1.4
 */
class IRemoteTextConnectionFactory2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteTextConnectionFactory2
     * @type {Guid}
     */
    static IID => Guid("{9425c7d9-ed9b-5d00-99cc-b0b8dc9e4c60}")

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
     * @param {Guid} connectionId 
     * @param {RemoteTextConnectionDataHandler} pduForwarder 
     * @param {Integer} options 
     * @returns {RemoteTextConnection} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(connectionId, pduForwarder, options) {
        result := ComCall(6, this, "ptr", connectionId, "ptr", pduForwarder, "uint", options, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteTextConnection(value)
    }
}
