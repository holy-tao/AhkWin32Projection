#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMMediaProps interface sets and retrieves the WM_MEDIA_TYPE structure for an input, stream, or output.In the case of inputs and streams, the contents of the media type structure determine what actions the writer object will perform on the input data when writing the file. Typically, the input media type is an uncompressed type and the stream is a compressed type, so that the contents of their respective media type structures will determine the settings passed by the writer to the codec that will compress the stream.In the case of outputs, the media type structure determines the settings used to decompress the contents of a stream. The Windows Media codecs are capable of delivering output content in a variety of formats.The methods of IWMMediaProps are inherited by IWMVideoMediaProps, which provides access to additional settings for specifying video media types. The methods are also inherited by IWMInputMediaProps and IWMOutputMediaProps.An instance of the IWMMediaProps interface exists for every stream configuration object, input media properties object, and output media properties object. You can retrieve a pointer to this interface by calling the QueryInterface method of any other interface in one of those objects.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmmediaprops
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMMediaProps extends IUnknown{
    /**
     * The interface identifier for IWMMediaProps
     * @type {Guid}
     */
    static IID => Guid("{96406bce-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} pguidType 
     * @returns {HRESULT} 
     */
    GetType(pguidType) {
        result := ComCall(3, this, "ptr", pguidType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WM_MEDIA_TYPE>} pType 
     * @param {Pointer<UInt32>} pcbType 
     * @returns {HRESULT} 
     */
    GetMediaType(pType, pcbType) {
        result := ComCall(4, this, "ptr", pType, "uint*", pcbType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WM_MEDIA_TYPE>} pType 
     * @returns {HRESULT} 
     */
    SetMediaType(pType) {
        result := ComCall(5, this, "ptr", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
