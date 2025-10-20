#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1SvgAttribute.ahk

/**
 * Interface describing SVG path data. Path data can be set as the 'd' attribute on a 'path' element.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nn-d2d1svg-id2d1svgpathdata
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1SvgPathData extends ID2D1SvgAttribute{
    /**
     * The interface identifier for ID2D1SvgPathData
     * @type {Guid}
     */
    static IID => Guid("{c095e4f4-bb98-43d6-9745-4d1b84ec9888}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {Integer} dataCount 
     * @returns {HRESULT} 
     */
    RemoveSegmentDataAtEnd(dataCount) {
        result := ComCall(6, this, "uint", dataCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} data 
     * @param {Integer} dataCount 
     * @param {Integer} startIndex 
     * @returns {HRESULT} 
     */
    UpdateSegmentData(data, dataCount, startIndex) {
        result := ComCall(7, this, "float*", data, "uint", dataCount, "uint", startIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} data 
     * @param {Integer} dataCount 
     * @param {Integer} startIndex 
     * @returns {HRESULT} 
     */
    GetSegmentData(data, dataCount, startIndex) {
        result := ComCall(8, this, "float*", data, "uint", dataCount, "uint", startIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSegmentDataCount() {
        result := ComCall(9, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} commandsCount 
     * @returns {HRESULT} 
     */
    RemoveCommandsAtEnd(commandsCount) {
        result := ComCall(10, this, "uint", commandsCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} commands 
     * @param {Integer} commandsCount 
     * @param {Integer} startIndex 
     * @returns {HRESULT} 
     */
    UpdateCommands(commands, commandsCount, startIndex) {
        result := ComCall(11, this, "int*", commands, "uint", commandsCount, "uint", startIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} commands 
     * @param {Integer} commandsCount 
     * @param {Integer} startIndex 
     * @returns {HRESULT} 
     */
    GetCommands(commands, commandsCount, startIndex) {
        result := ComCall(12, this, "int*", commands, "uint", commandsCount, "uint", startIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCommandsCount() {
        result := ComCall(13, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} fillMode 
     * @param {Pointer<ID2D1PathGeometry1>} pathGeometry 
     * @returns {HRESULT} 
     */
    CreatePathGeometry(fillMode, pathGeometry) {
        result := ComCall(14, this, "int", fillMode, "ptr", pathGeometry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
