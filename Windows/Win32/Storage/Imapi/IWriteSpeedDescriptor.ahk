#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use this interface retrieve detailed write configurations supported by the disc recorder and current media, for example, the media type, write speed, rotational-speed control type.
 * @remarks
 * 
  * This is a <b>MsftWriteSpeedDescriptor</b> object in script.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-iwritespeeddescriptor
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IWriteSpeedDescriptor extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWriteSpeedDescriptor
     * @type {Guid}
     */
    static IID => Guid("{27354144-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MediaType", "get_RotationTypeIsPureCAV", "get_WriteSpeed"]

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwritespeeddescriptor-get_mediatype
     */
    get_MediaType(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwritespeeddescriptor-get_rotationtypeispurecav
     */
    get_RotationTypeIsPureCAV(value) {
        result := ComCall(8, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwritespeeddescriptor-get_writespeed
     */
    get_WriteSpeed(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, valueMarshal, value, "HRESULT")
        return result
    }
}
