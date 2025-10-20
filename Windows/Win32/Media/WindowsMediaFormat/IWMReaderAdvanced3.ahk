#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMReaderAdvanced2.ahk

/**
 * The IWMReaderAdvanced3 interface provides additional functionality to the reader object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreaderadvanced3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderAdvanced3 extends IWMReaderAdvanced2{
    /**
     * The interface identifier for IWMReaderAdvanced3
     * @type {Guid}
     */
    static IID => Guid("{5dc0674b-f04b-4a4e-9f2a-b1afde2c8100}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 38

    /**
     * 
     * @returns {HRESULT} 
     */
    StopNetStreaming() {
        result := ComCall(38, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<Void>} pvOffsetStart 
     * @param {Pointer<Void>} pvDuration 
     * @param {Integer} dwOffsetFormat 
     * @param {Float} fRate 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     */
    StartAtPosition(wStreamNum, pvOffsetStart, pvDuration, dwOffsetFormat, fRate, pvContext) {
        result := ComCall(39, this, "ushort", wStreamNum, "ptr", pvOffsetStart, "ptr", pvDuration, "int", dwOffsetFormat, "float", fRate, "ptr", pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
