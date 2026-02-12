#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class IMediaExtensionManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaExtensionManager
     * @type {Guid}
     */
    static IID => Guid("{4a25eaf5-242d-4dfb-97f4-69b7c42576ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterSchemeHandler", "RegisterSchemeHandlerWithSettings", "RegisterByteStreamHandler", "RegisterByteStreamHandlerWithSettings", "RegisterAudioDecoder", "RegisterAudioDecoderWithSettings", "RegisterAudioEncoder", "RegisterAudioEncoderWithSettings", "RegisterVideoDecoder", "RegisterVideoDecoderWithSettings", "RegisterVideoEncoder", "RegisterVideoEncoderWithSettings"]

    /**
     * 
     * @param {HSTRING} activatableClassId 
     * @param {HSTRING} scheme 
     * @returns {HRESULT} 
     */
    RegisterSchemeHandler(activatableClassId, scheme) {
        if(activatableClassId is String) {
            pin := HSTRING.Create(activatableClassId)
            activatableClassId := pin.Value
        }
        activatableClassId := activatableClassId is Win32Handle ? NumGet(activatableClassId, "ptr") : activatableClassId
        if(scheme is String) {
            pin := HSTRING.Create(scheme)
            scheme := pin.Value
        }
        scheme := scheme is Win32Handle ? NumGet(scheme, "ptr") : scheme

        result := ComCall(6, this, "ptr", activatableClassId, "ptr", scheme, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} activatableClassId 
     * @param {HSTRING} scheme 
     * @param {IPropertySet} configuration 
     * @returns {HRESULT} 
     */
    RegisterSchemeHandlerWithSettings(activatableClassId, scheme, configuration) {
        if(activatableClassId is String) {
            pin := HSTRING.Create(activatableClassId)
            activatableClassId := pin.Value
        }
        activatableClassId := activatableClassId is Win32Handle ? NumGet(activatableClassId, "ptr") : activatableClassId
        if(scheme is String) {
            pin := HSTRING.Create(scheme)
            scheme := pin.Value
        }
        scheme := scheme is Win32Handle ? NumGet(scheme, "ptr") : scheme

        result := ComCall(7, this, "ptr", activatableClassId, "ptr", scheme, "ptr", configuration, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} activatableClassId 
     * @param {HSTRING} fileExtension 
     * @param {HSTRING} mimeType 
     * @returns {HRESULT} 
     */
    RegisterByteStreamHandler(activatableClassId, fileExtension, mimeType) {
        if(activatableClassId is String) {
            pin := HSTRING.Create(activatableClassId)
            activatableClassId := pin.Value
        }
        activatableClassId := activatableClassId is Win32Handle ? NumGet(activatableClassId, "ptr") : activatableClassId
        if(fileExtension is String) {
            pin := HSTRING.Create(fileExtension)
            fileExtension := pin.Value
        }
        fileExtension := fileExtension is Win32Handle ? NumGet(fileExtension, "ptr") : fileExtension
        if(mimeType is String) {
            pin := HSTRING.Create(mimeType)
            mimeType := pin.Value
        }
        mimeType := mimeType is Win32Handle ? NumGet(mimeType, "ptr") : mimeType

        result := ComCall(8, this, "ptr", activatableClassId, "ptr", fileExtension, "ptr", mimeType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} activatableClassId 
     * @param {HSTRING} fileExtension 
     * @param {HSTRING} mimeType 
     * @param {IPropertySet} configuration 
     * @returns {HRESULT} 
     */
    RegisterByteStreamHandlerWithSettings(activatableClassId, fileExtension, mimeType, configuration) {
        if(activatableClassId is String) {
            pin := HSTRING.Create(activatableClassId)
            activatableClassId := pin.Value
        }
        activatableClassId := activatableClassId is Win32Handle ? NumGet(activatableClassId, "ptr") : activatableClassId
        if(fileExtension is String) {
            pin := HSTRING.Create(fileExtension)
            fileExtension := pin.Value
        }
        fileExtension := fileExtension is Win32Handle ? NumGet(fileExtension, "ptr") : fileExtension
        if(mimeType is String) {
            pin := HSTRING.Create(mimeType)
            mimeType := pin.Value
        }
        mimeType := mimeType is Win32Handle ? NumGet(mimeType, "ptr") : mimeType

        result := ComCall(9, this, "ptr", activatableClassId, "ptr", fileExtension, "ptr", mimeType, "ptr", configuration, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} activatableClassId 
     * @param {Guid} inputSubtype 
     * @param {Guid} outputSubtype 
     * @returns {HRESULT} 
     */
    RegisterAudioDecoder(activatableClassId, inputSubtype, outputSubtype) {
        if(activatableClassId is String) {
            pin := HSTRING.Create(activatableClassId)
            activatableClassId := pin.Value
        }
        activatableClassId := activatableClassId is Win32Handle ? NumGet(activatableClassId, "ptr") : activatableClassId

        result := ComCall(10, this, "ptr", activatableClassId, "ptr", inputSubtype, "ptr", outputSubtype, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} activatableClassId 
     * @param {Guid} inputSubtype 
     * @param {Guid} outputSubtype 
     * @param {IPropertySet} configuration 
     * @returns {HRESULT} 
     */
    RegisterAudioDecoderWithSettings(activatableClassId, inputSubtype, outputSubtype, configuration) {
        if(activatableClassId is String) {
            pin := HSTRING.Create(activatableClassId)
            activatableClassId := pin.Value
        }
        activatableClassId := activatableClassId is Win32Handle ? NumGet(activatableClassId, "ptr") : activatableClassId

        result := ComCall(11, this, "ptr", activatableClassId, "ptr", inputSubtype, "ptr", outputSubtype, "ptr", configuration, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} activatableClassId 
     * @param {Guid} inputSubtype 
     * @param {Guid} outputSubtype 
     * @returns {HRESULT} 
     */
    RegisterAudioEncoder(activatableClassId, inputSubtype, outputSubtype) {
        if(activatableClassId is String) {
            pin := HSTRING.Create(activatableClassId)
            activatableClassId := pin.Value
        }
        activatableClassId := activatableClassId is Win32Handle ? NumGet(activatableClassId, "ptr") : activatableClassId

        result := ComCall(12, this, "ptr", activatableClassId, "ptr", inputSubtype, "ptr", outputSubtype, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} activatableClassId 
     * @param {Guid} inputSubtype 
     * @param {Guid} outputSubtype 
     * @param {IPropertySet} configuration 
     * @returns {HRESULT} 
     */
    RegisterAudioEncoderWithSettings(activatableClassId, inputSubtype, outputSubtype, configuration) {
        if(activatableClassId is String) {
            pin := HSTRING.Create(activatableClassId)
            activatableClassId := pin.Value
        }
        activatableClassId := activatableClassId is Win32Handle ? NumGet(activatableClassId, "ptr") : activatableClassId

        result := ComCall(13, this, "ptr", activatableClassId, "ptr", inputSubtype, "ptr", outputSubtype, "ptr", configuration, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} activatableClassId 
     * @param {Guid} inputSubtype 
     * @param {Guid} outputSubtype 
     * @returns {HRESULT} 
     */
    RegisterVideoDecoder(activatableClassId, inputSubtype, outputSubtype) {
        if(activatableClassId is String) {
            pin := HSTRING.Create(activatableClassId)
            activatableClassId := pin.Value
        }
        activatableClassId := activatableClassId is Win32Handle ? NumGet(activatableClassId, "ptr") : activatableClassId

        result := ComCall(14, this, "ptr", activatableClassId, "ptr", inputSubtype, "ptr", outputSubtype, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} activatableClassId 
     * @param {Guid} inputSubtype 
     * @param {Guid} outputSubtype 
     * @param {IPropertySet} configuration 
     * @returns {HRESULT} 
     */
    RegisterVideoDecoderWithSettings(activatableClassId, inputSubtype, outputSubtype, configuration) {
        if(activatableClassId is String) {
            pin := HSTRING.Create(activatableClassId)
            activatableClassId := pin.Value
        }
        activatableClassId := activatableClassId is Win32Handle ? NumGet(activatableClassId, "ptr") : activatableClassId

        result := ComCall(15, this, "ptr", activatableClassId, "ptr", inputSubtype, "ptr", outputSubtype, "ptr", configuration, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} activatableClassId 
     * @param {Guid} inputSubtype 
     * @param {Guid} outputSubtype 
     * @returns {HRESULT} 
     */
    RegisterVideoEncoder(activatableClassId, inputSubtype, outputSubtype) {
        if(activatableClassId is String) {
            pin := HSTRING.Create(activatableClassId)
            activatableClassId := pin.Value
        }
        activatableClassId := activatableClassId is Win32Handle ? NumGet(activatableClassId, "ptr") : activatableClassId

        result := ComCall(16, this, "ptr", activatableClassId, "ptr", inputSubtype, "ptr", outputSubtype, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} activatableClassId 
     * @param {Guid} inputSubtype 
     * @param {Guid} outputSubtype 
     * @param {IPropertySet} configuration 
     * @returns {HRESULT} 
     */
    RegisterVideoEncoderWithSettings(activatableClassId, inputSubtype, outputSubtype, configuration) {
        if(activatableClassId is String) {
            pin := HSTRING.Create(activatableClassId)
            activatableClassId := pin.Value
        }
        activatableClassId := activatableClassId is Win32Handle ? NumGet(activatableClassId, "ptr") : activatableClassId

        result := ComCall(17, this, "ptr", activatableClassId, "ptr", inputSubtype, "ptr", outputSubtype, "ptr", configuration, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
