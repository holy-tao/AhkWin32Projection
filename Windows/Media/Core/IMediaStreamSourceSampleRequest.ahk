#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IMediaStreamDescriptor.ahk
#Include .\MediaStreamSourceSampleRequestDeferral.ahk
#Include .\MediaStreamSample.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaStreamSourceSampleRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaStreamSourceSampleRequest
     * @type {Guid}
     */
    static IID => Guid("{4db341a9-3501-4d9b-83f9-8f235c822532}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StreamDescriptor", "GetDeferral", "put_Sample", "get_Sample", "ReportSampleProgress"]

    /**
     * @type {IMediaStreamDescriptor} 
     */
    StreamDescriptor {
        get => this.get_StreamDescriptor()
    }

    /**
     * @type {MediaStreamSample} 
     */
    Sample {
        get => this.get_Sample()
        set => this.put_Sample(value)
    }

    /**
     * 
     * @returns {IMediaStreamDescriptor} 
     */
    get_StreamDescriptor() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMediaStreamDescriptor(value)
    }

    /**
     * 
     * @returns {MediaStreamSourceSampleRequestDeferral} 
     */
    GetDeferral() {
        result := ComCall(7, this, "ptr*", &deferral_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaStreamSourceSampleRequestDeferral(deferral_)
    }

    /**
     * 
     * @param {MediaStreamSample} value 
     * @returns {HRESULT} 
     */
    put_Sample(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaStreamSample} 
     */
    get_Sample() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaStreamSample(value)
    }

    /**
     * 
     * @param {Integer} progress 
     * @returns {HRESULT} 
     */
    ReportSampleProgress(progress) {
        result := ComCall(10, this, "uint", progress, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
