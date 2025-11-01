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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RemoveSegmentDataAtEnd", "UpdateSegmentData", "GetSegmentData", "GetSegmentDataCount", "RemoveCommandsAtEnd", "UpdateCommands", "GetCommands", "GetCommandsCount", "CreatePathGeometry"]

    /**
     * 
     * @param {Integer} dataCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpathdata-removesegmentdataatend
     */
    RemoveSegmentDataAtEnd(dataCount) {
        result := ComCall(6, this, "uint", dataCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} data 
     * @param {Integer} dataCount 
     * @param {Integer} startIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpathdata-updatesegmentdata
     */
    UpdateSegmentData(data, dataCount, startIndex) {
        dataMarshal := data is VarRef ? "float*" : "ptr"

        result := ComCall(7, this, dataMarshal, data, "uint", dataCount, "uint", startIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} data 
     * @param {Integer} dataCount 
     * @param {Integer} startIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpathdata-getsegmentdata
     */
    GetSegmentData(data, dataCount, startIndex) {
        dataMarshal := data is VarRef ? "float*" : "ptr"

        result := ComCall(8, this, dataMarshal, data, "uint", dataCount, "uint", startIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpathdata-getsegmentdatacount
     */
    GetSegmentDataCount() {
        result := ComCall(9, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} commandsCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpathdata-removecommandsatend
     */
    RemoveCommandsAtEnd(commandsCount) {
        result := ComCall(10, this, "uint", commandsCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} commands 
     * @param {Integer} commandsCount 
     * @param {Integer} startIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpathdata-updatecommands
     */
    UpdateCommands(commands, commandsCount, startIndex) {
        commandsMarshal := commands is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, commandsMarshal, commands, "uint", commandsCount, "uint", startIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} commands 
     * @param {Integer} commandsCount 
     * @param {Integer} startIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpathdata-getcommands
     */
    GetCommands(commands, commandsCount, startIndex) {
        commandsMarshal := commands is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, commandsMarshal, commands, "uint", commandsCount, "uint", startIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpathdata-getcommandscount
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpathdata-createpathgeometry
     */
    CreatePathGeometry(fillMode, pathGeometry) {
        result := ComCall(14, this, "int", fillMode, "ptr*", pathGeometry, "HRESULT")
        return result
    }
}
