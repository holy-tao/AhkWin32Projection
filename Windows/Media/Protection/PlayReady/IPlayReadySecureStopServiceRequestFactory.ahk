#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PlayReadySecureStopServiceRequest.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadySecureStopServiceRequestFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadySecureStopServiceRequestFactory
     * @type {Guid}
     */
    static IID => Guid("{0e448ac9-e67e-494e-9f49-6285438c76cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance", "CreateInstanceFromSessionID"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {Integer} publisherCertBytes_length 
     * @param {Pointer<Integer>} publisherCertBytes 
     * @returns {PlayReadySecureStopServiceRequest} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(publisherCertBytes_length, publisherCertBytes) {
        publisherCertBytesMarshal := publisherCertBytes is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "uint", publisherCertBytes_length, publisherCertBytesMarshal, publisherCertBytes, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlayReadySecureStopServiceRequest(instance)
    }

    /**
     * 
     * @param {Guid} sessionID 
     * @param {Integer} publisherCertBytes_length 
     * @param {Pointer<Integer>} publisherCertBytes 
     * @returns {PlayReadySecureStopServiceRequest} 
     */
    CreateInstanceFromSessionID(sessionID, publisherCertBytes_length, publisherCertBytes) {
        publisherCertBytesMarshal := publisherCertBytes is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "ptr", sessionID, "uint", publisherCertBytes_length, publisherCertBytesMarshal, publisherCertBytes, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlayReadySecureStopServiceRequest(instance)
    }
}
