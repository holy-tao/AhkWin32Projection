#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\NDTCPMessenger.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class INDTCPMessengerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INDTCPMessengerFactory
     * @type {Guid}
     */
    static IID => Guid("{7dd85cfe-1b99-4f68-8f82-8177f7cedf2b}")

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
     * @param {HSTRING} remoteHostName 
     * @param {Integer} remoteHostPort 
     * @returns {NDTCPMessenger} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(remoteHostName, remoteHostPort) {
        if(remoteHostName is String) {
            pin := HSTRING.Create(remoteHostName)
            remoteHostName := pin.Value
        }
        remoteHostName := remoteHostName is Win32Handle ? NumGet(remoteHostName, "ptr") : remoteHostName

        result := ComCall(6, this, "ptr", remoteHostName, "uint", remoteHostPort, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NDTCPMessenger(instance)
    }
}
