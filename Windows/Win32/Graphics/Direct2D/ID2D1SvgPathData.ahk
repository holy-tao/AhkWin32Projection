#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1PathGeometry1.ahk
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
     * Removes data from the end of the segment data array.
     * @param {Integer} dataCount Type: <b>UINT32</b>
     * 
     * Specifies how much data to remove.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgpathdata-removesegmentdataatend
     */
    RemoveSegmentDataAtEnd(dataCount) {
        result := ComCall(6, this, "uint", dataCount, "HRESULT")
        return result
    }

    /**
     * Updates the segment data array. Existing segment data not updated by this method are preserved. The array is resized larger if necessary to accomodate the new segment data.
     * @param {Pointer<Float>} data Type: <b>const FLOAT*</b>
     * 
     * The data array.
     * @param {Integer} dataCount Type: <b>UINT32</b>
     * 
     * The number of data to update.
     * @param {Integer} startIndex Type: <b>UINT32</b>
     * 
     * The index at which to begin updating segment data. Must be less than or equal to the size of the segment data array.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgpathdata-updatesegmentdata
     */
    UpdateSegmentData(data, dataCount, startIndex) {
        dataMarshal := data is VarRef ? "float*" : "ptr"

        result := ComCall(7, this, dataMarshal, data, "uint", dataCount, "uint", startIndex, "HRESULT")
        return result
    }

    /**
     * Gets data from the segment data array.
     * @param {Integer} dataCount Type: <b>UINT32</b>
     * 
     * The element count of the buffer.
     * @param {Integer} startIndex Type: <b>UINT32</b>
     * 
     * The index of the first segment data to retrieve.
     * @returns {Float} Type: <b>FLOAT*</b>
     * 
     * Buffer to contain the segment data array.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgpathdata-getsegmentdata
     */
    GetSegmentData(dataCount, startIndex) {
        result := ComCall(8, this, "float*", &data := 0, "uint", dataCount, "uint", startIndex, "HRESULT")
        return data
    }

    /**
     * Gets the size of the segment data array.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * Returns the size of the segment data array.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgpathdata-getsegmentdatacount
     */
    GetSegmentDataCount() {
        result := ComCall(9, this, "uint")
        return result
    }

    /**
     * Removes commands from the end of the commands array.
     * @param {Integer} commandsCount Type: <b>UINT32</b>
     * 
     * Specifies how many commands to remove.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgpathdata-removecommandsatend
     */
    RemoveCommandsAtEnd(commandsCount) {
        result := ComCall(10, this, "uint", commandsCount, "HRESULT")
        return result
    }

    /**
     * Updates the commands array. Existing commands not updated by this method are preserved. The array is resized larger if necessary to accomodate the new commands.
     * @param {Pointer<Integer>} commands Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1svg/ne-d2d1svg-d2d1_svg_path_command">D2D1_SVG_PATH_COMMAND</a>*</b>
     * 
     * The commands array.
     * @param {Integer} commandsCount Type: <b>UINT32</b>
     * 
     * The number of commands to update.
     * @param {Integer} startIndex Type: <b>UINT32</b>
     * 
     * The index at which to begin updating commands. Must be less than or equal to the size of the commands array.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgpathdata-updatecommands
     */
    UpdateCommands(commands, commandsCount, startIndex) {
        commandsMarshal := commands is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, commandsMarshal, commands, "uint", commandsCount, "uint", startIndex, "HRESULT")
        return result
    }

    /**
     * Gets commands from the commands array.
     * @param {Integer} commandsCount Type: <b>UINT32</b>
     * 
     * The element count of the buffer.
     * @param {Integer} startIndex Type: <b>UINT32</b>
     * 
     * The index of the first commands to retrieve.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1svg/ne-d2d1svg-d2d1_svg_path_command">D2D1_SVG_PATH_COMMAND</a>*</b>
     * 
     * Buffer to contain the commands.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgpathdata-getcommands
     */
    GetCommands(commandsCount, startIndex) {
        result := ComCall(12, this, "int*", &commands := 0, "uint", commandsCount, "uint", startIndex, "HRESULT")
        return commands
    }

    /**
     * Gets the size of the commands array.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * Returns the size of the commands array.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgpathdata-getcommandscount
     */
    GetCommandsCount() {
        result := ComCall(13, this, "uint")
        return result
    }

    /**
     * Creates a path geometry object representing the path data.
     * @param {Integer} fillMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_fill_mode">D2D1_FILL_MODE</a></b>
     * 
     * Fill mode for the path geometry object.
     * @returns {ID2D1PathGeometry1} Type: <b>ID2D1PathGeometry1**</b>
     * 
     * On completion, pathGeometry will contain a point to the created <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1pathgeometry1">ID2D1PathGeometry1</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgpathdata-createpathgeometry
     */
    CreatePathGeometry(fillMode) {
        result := ComCall(14, this, "int", fillMode, "ptr*", &pathGeometry := 0, "HRESULT")
        return ID2D1PathGeometry1(pathGeometry)
    }
}
