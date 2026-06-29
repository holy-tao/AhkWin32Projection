#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1SvgAttribute.ahk" { ID2D1SvgAttribute }
#Import "Common\D2D1_FILL_MODE.ahk" { D2D1_FILL_MODE }
#Import ".\D2D1_SVG_PATH_COMMAND.ahk" { D2D1_SVG_PATH_COMMAND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1PathGeometry1.ahk" { ID2D1PathGeometry1 }

/**
 * Interface describing SVG path data. Path data can be set as the 'd' attribute on a 'path' element.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nn-d2d1svg-id2d1svgpathdata
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1SvgPathData extends ID2D1SvgAttribute {
    /**
     * The interface identifier for ID2D1SvgPathData
     * @type {Guid}
     */
    static IID := Guid("{c095e4f4-bb98-43d6-9745-4d1b84ec9888}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1SvgPathData interfaces
    */
    struct Vtbl extends ID2D1SvgAttribute.Vtbl {
        RemoveSegmentDataAtEnd : IntPtr
        UpdateSegmentData      : IntPtr
        GetSegmentData         : IntPtr
        GetSegmentDataCount    : IntPtr
        RemoveCommandsAtEnd    : IntPtr
        UpdateCommands         : IntPtr
        GetCommands            : IntPtr
        GetCommandsCount       : IntPtr
        CreatePathGeometry     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1SvgPathData.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Removes data from the end of the segment data array.
     * @param {Integer} dataCount Type: <b>UINT32</b>
     * 
     * Specifies how much data to remove.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpathdata-removesegmentdataatend
     */
    RemoveSegmentDataAtEnd(dataCount) {
        result := ComCall(6, this, "uint", dataCount, "HRESULT")
        return result
    }

    /**
     * Updates the segment data array. Existing segment data not updated by this method are preserved. The array is resized larger if necessary to accommodate the new segment data.
     * @param {Pointer<Float>} data Type: <b>const FLOAT*</b>
     * 
     * The data array.
     * @param {Integer} dataCount Type: <b>UINT32</b>
     * 
     * The number of data to update.
     * @param {Integer} startIndex Type: <b>UINT32</b>
     * 
     * The index at which to begin updating segment data. Must be less than or equal to the size of the segment data array.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpathdata-updatesegmentdata
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpathdata-getsegmentdata
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpathdata-getsegmentdatacount
     */
    GetSegmentDataCount() {
        result := ComCall(9, this, UInt32)
        return result
    }

    /**
     * Removes commands from the end of the commands array.
     * @param {Integer} commandsCount Type: <b>UINT32</b>
     * 
     * Specifies how many commands to remove.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpathdata-removecommandsatend
     */
    RemoveCommandsAtEnd(commandsCount) {
        result := ComCall(10, this, "uint", commandsCount, "HRESULT")
        return result
    }

    /**
     * Updates the commands array. Existing commands not updated by this method are preserved. The array is resized larger if necessary to accommodate the new commands.
     * @param {Pointer<D2D1_SVG_PATH_COMMAND>} commands Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1svg/ne-d2d1svg-d2d1_svg_path_command">D2D1_SVG_PATH_COMMAND</a>*</b>
     * 
     * The commands array.
     * @param {Integer} commandsCount Type: <b>UINT32</b>
     * 
     * The number of commands to update.
     * @param {Integer} startIndex Type: <b>UINT32</b>
     * 
     * The index at which to begin updating commands. Must be less than or equal to the size of the commands array.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpathdata-updatecommands
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
     * @returns {D2D1_SVG_PATH_COMMAND} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1svg/ne-d2d1svg-d2d1_svg_path_command">D2D1_SVG_PATH_COMMAND</a>*</b>
     * 
     * Buffer to contain the commands.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpathdata-getcommands
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpathdata-getcommandscount
     */
    GetCommandsCount() {
        result := ComCall(13, this, UInt32)
        return result
    }

    /**
     * Creates a path geometry object representing the path data.
     * @param {D2D1_FILL_MODE} _fillMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_fill_mode">D2D1_FILL_MODE</a></b>
     * 
     * Fill mode for the path geometry object.
     * @returns {ID2D1PathGeometry1} Type: <b>ID2D1PathGeometry1**</b>
     * 
     * On completion, pathGeometry will contain a point to the created <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1pathgeometry1">ID2D1PathGeometry1</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpathdata-createpathgeometry
     */
    CreatePathGeometry(_fillMode) {
        result := ComCall(14, this, D2D1_FILL_MODE, _fillMode, "ptr*", &pathGeometry := 0, "HRESULT")
        return ID2D1PathGeometry1(pathGeometry)
    }

    Query(iid) {
        if (ID2D1SvgPathData.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RemoveSegmentDataAtEnd := CallbackCreate(GetMethod(implObj, "RemoveSegmentDataAtEnd"), flags, 2)
        this.vtbl.UpdateSegmentData := CallbackCreate(GetMethod(implObj, "UpdateSegmentData"), flags, 4)
        this.vtbl.GetSegmentData := CallbackCreate(GetMethod(implObj, "GetSegmentData"), flags, 4)
        this.vtbl.GetSegmentDataCount := CallbackCreate(GetMethod(implObj, "GetSegmentDataCount"), flags, 1)
        this.vtbl.RemoveCommandsAtEnd := CallbackCreate(GetMethod(implObj, "RemoveCommandsAtEnd"), flags, 2)
        this.vtbl.UpdateCommands := CallbackCreate(GetMethod(implObj, "UpdateCommands"), flags, 4)
        this.vtbl.GetCommands := CallbackCreate(GetMethod(implObj, "GetCommands"), flags, 4)
        this.vtbl.GetCommandsCount := CallbackCreate(GetMethod(implObj, "GetCommandsCount"), flags, 1)
        this.vtbl.CreatePathGeometry := CallbackCreate(GetMethod(implObj, "CreatePathGeometry"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RemoveSegmentDataAtEnd)
        CallbackFree(this.vtbl.UpdateSegmentData)
        CallbackFree(this.vtbl.GetSegmentData)
        CallbackFree(this.vtbl.GetSegmentDataCount)
        CallbackFree(this.vtbl.RemoveCommandsAtEnd)
        CallbackFree(this.vtbl.UpdateCommands)
        CallbackFree(this.vtbl.GetCommands)
        CallbackFree(this.vtbl.GetCommandsCount)
        CallbackFree(this.vtbl.CreatePathGeometry)
    }
}
