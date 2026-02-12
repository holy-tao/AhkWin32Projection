#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PlayReadySecureStopIterable.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadySecureStopIterableFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadySecureStopIterableFactory
     * @type {Guid}
     */
    static IID => Guid("{5f1f0165-4214-4d9e-81eb-e89f9d294aee}")

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
     * @param {Integer} publisherCertBytes_length 
     * @param {Pointer<Integer>} publisherCertBytes 
     * @returns {PlayReadySecureStopIterable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(publisherCertBytes_length, publisherCertBytes) {
        publisherCertBytesMarshal := publisherCertBytes is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "uint", publisherCertBytes_length, publisherCertBytesMarshal, publisherCertBytes, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlayReadySecureStopIterable(instance)
    }
}
