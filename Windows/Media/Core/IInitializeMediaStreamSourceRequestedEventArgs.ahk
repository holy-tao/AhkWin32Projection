#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaStreamSource.ahk
#Include ..\..\Storage\Streams\IRandomAccessStream.ahk
#Include ..\..\Foundation\Deferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IInitializeMediaStreamSourceRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInitializeMediaStreamSourceRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{25bc45e1-9b08-4c2e-a855-4542f1a75deb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Source", "get_RandomAccessStream", "GetDeferral"]

    /**
     * @type {MediaStreamSource} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * @type {IRandomAccessStream} 
     */
    RandomAccessStream {
        get => this.get_RandomAccessStream()
    }

    /**
     * 
     * @returns {MediaStreamSource} 
     */
    get_Source() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaStreamSource(value)
    }

    /**
     * 
     * @returns {IRandomAccessStream} 
     */
    get_RandomAccessStream() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStream(value)
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(result_)
    }
}
