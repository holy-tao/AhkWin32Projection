#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides properties of signed messages.
 * @remarks
 * 
  * An application can acquire this interface by calling the <a href="https://docs.microsoft.com/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveredservice">IWSDiscoveredService</a>.
  * 
  * <b>IWSDSignatureProperty</b> is useful to an application that wants to perform its own signature validation.  By passing a <b>NULL</b> to the <i>pConfigParam</i> of <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-wsdcreatediscoveryprovider2">WSDCreateDiscoveryProvider2</a>, the internal signature validation is disabled and the provider can perform its own validation by examining these properties.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nn-wsdbase-iwsdsignatureproperty
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDSignatureProperty extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDSignatureProperty
     * @type {Guid}
     */
    static IID => Guid("{03ce20aa-71c4-45e2-b32e-3766c61c790f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsMessageSigned", "IsMessageSignatureTrusted", "GetKeyInfo", "GetSignature", "GetSignedInfoHash"]

    /**
     * 
     * @param {Pointer<BOOL>} pbSigned 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdsignatureproperty-ismessagesigned
     */
    IsMessageSigned(pbSigned) {
        result := ComCall(3, this, "ptr", pbSigned, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbSignatureTrusted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdsignatureproperty-ismessagesignaturetrusted
     */
    IsMessageSignatureTrusted(pbSignatureTrusted) {
        result := ComCall(4, this, "ptr", pbSignatureTrusted, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pbKeyInfo 
     * @param {Pointer<Integer>} pdwKeyInfoSize 
     * @returns {HRESULT} 
     */
    GetKeyInfo(pbKeyInfo, pdwKeyInfoSize) {
        result := ComCall(5, this, "ptr", pbKeyInfo, "uint*", pdwKeyInfoSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pbSignature 
     * @param {Pointer<Integer>} pdwSignatureSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdsignatureproperty-getsignature
     */
    GetSignature(pbSignature, pdwSignatureSize) {
        result := ComCall(6, this, "ptr", pbSignature, "uint*", pdwSignatureSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pbSignedInfoHash 
     * @param {Pointer<Integer>} pdwHashSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdsignatureproperty-getsignedinfohash
     */
    GetSignedInfoHash(pbSignedInfoHash, pdwHashSize) {
        result := ComCall(7, this, "ptr", pbSignedInfoHash, "uint*", pdwHashSize, "HRESULT")
        return result
    }
}
