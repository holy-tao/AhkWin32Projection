#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaStreamSample.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaStreamSampleStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaStreamSampleStatics2
     * @type {Guid}
     */
    static IID => Guid("{9efe9521-6d46-494c-a2f8-d662922e2dd7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromDirect3D11Surface"]

    /**
     * 
     * @param {IDirect3DSurface} surface 
     * @param {TimeSpan} timestamp_ 
     * @returns {MediaStreamSample} 
     */
    CreateFromDirect3D11Surface(surface, timestamp_) {
        result := ComCall(6, this, "ptr", surface, "ptr", timestamp_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaStreamSample(result_)
    }
}
