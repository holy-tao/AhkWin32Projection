#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Xps.Printing
 * @version v4.0.30319
 */
class Printing {

;@region Constants

    /**
     * @type {String}
     */
    static ID_DOCUMENTPACKAGETARGET_MSXPS => "{9cae40a8-ded1-41c9-a9fd-d735ef33aeda}"

    /**
     * @type {String}
     */
    static ID_DOCUMENTPACKAGETARGET_OPENXPS => "{0056bb72-8c9c-4612-bd0f-93012a87099d}"

    /**
     * @type {String}
     */
    static ID_DOCUMENTPACKAGETARGET_OPENXPS_WITH_3D => "{63dbd720-8b14-4577-b074-7bb11b596d28}"
;@endregion Constants

;@region Methods
    /**
     * Starts printing an XPS document stream to a printer.
     * @remarks
     * <b>StartXpsPrintJob</b> is an asynchronous function, which can return before the print spooler creates or starts a print job.
     * 
     * The interfaces that are returned in <i>xpsPrintJob</i>, <i>documentStream</i>, and <i>printTicketStream</i> must not be used until <b>StartXpsPrintJob</b> has returned successfully.
     * 
     *   After the caller starts sending data, it should monitor the progress events that are signaled to the event that is passed in <i>progressEvent</i>. When the event is signaled, the caller must  call <a href="https://docs.microsoft.com/windows/desktop/api/xpsprint/nf-xpsprint-ixpsprintjob-getjobstatus">IXpsPrintJob::GetJobStatus</a> to get the current status of the print job.
     * 
     * When the print job finishes, whether successfully or not, the event that is passed in <i>completionEvent</i> is signaled once and only once. To prevent data loss, the caller should monitor this event and the thread or the application of the caller should not be terminated until the event  has been signaled.
     * 
     * Job states are neither stored nor queued by the print spooler. Because job processing does not wait for the status to be read after events are signaled,  the caller might miss some state changes, depending on the delay between the time the application received the change notification and the time it called <a href="https://docs.microsoft.com/windows/desktop/api/xpsprint/nf-xpsprint-ixpsprintjob-getjobstatus">IXpsPrintJob::GetJobStatus</a>. To receive subsequent notifications, the application must reset the progress event after it has received the notification.
     * 
     * If a call to <b>StartXpsPrintJob</b> fails,  the job status will be updated, the  completion and progress events will be signaled, and an error code will be returned. To get the status of the failed print job, call <a href="https://docs.microsoft.com/windows/desktop/api/xpsprint/nf-xpsprint-ixpsprintjob-getjobstatus">IXpsPrintJob::GetJobStatus</a>.
     * 
     * <b>StartXpsPrintJob</b> calls <b>DuplicateHandle</b> on <i>completionEvent</i> and <i>progressEvent</i> to ensure that they remain valid for the lifetime of the job.  Because the print spooler is using a duplicate handle for the events,  it is possible for the caller to close these handles at any point without affecting job execution.  The recommended procedure, however,  is for the caller to close these handles only after the <i>completionEvent</i> event has been signaled and observed by the caller.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/xpsprint/nn-xpsprint-ixpsprintjobstream">IXpsPrintJobStream</a> interfaces that are returned in <i>documentStream</i>  and <i>printTicketStream</i> are write-only streams that do not permit seeking but that can be closed. The caller writes the  XPS document and print ticket content into these streams, and then calls <a href="https://docs.microsoft.com/windows/desktop/api/xpsprint/nf-xpsprint-ixpsprintjobstream-close">Close</a> after all data has been written.  Calls to the streams' <b>Write</b>   method    are thread-safe; however, if such calls  are made from different threads, they are not guaranteed to be committed to the stream in the expected order.
     * 
     * <div class="alert"><b>Note</b>   When printing to a file, the application is responsible for providing the value that will be passed in the <i>outputFileName</i> parameter for print-to-file operations.  To print to a printer which uses a  driver that outputs to the FILE: port, the caller must retrieve the file name from the user by displaying the common file dialog.
     * </div>
     * <div> </div>
     * @param {Pointer<PWSTR>} printerName The name of the printer with which this job will be associated.
     * @param {Pointer<PWSTR>} jobName A user-specified  job name to be associated with this job.  If the job does not require a  separate, user-specified name, this parameter can be set to <b>NULL</b>.
     * @param {Pointer<PWSTR>} outputFileName The  file name of the file or port into which the output of this job is to be redirected.  Setting this value will cause the output of the print job to be directed to the specified file or port. To send the print job to the printer that is specified by <i>printerName</i>, this parameter must be set to <b>NULL</b>.
     * @param {Pointer<HANDLE>} progressEvent An event handle that is signaled when the following print job changes occur:
     * <ul>
     * <li>A job ID is assigned to the print job</li>
     * <li>Printing of a page has finished</li>
     * <li>Printing of a document has finished</li>
     * <li>The print job has been canceled or has ended because of an error</li>
     * </ul>
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  This event will not be signaled until after the application has started sending data to the print job.</div>
     * <div> </div>
     * 
     * 
     * The XPS Print API does not reset this event—that is the caller's responsibility.
     * 
     * 
     * If no progress notification is required, this parameter can be set to <b>NULL</b>.
     * @param {Pointer<HANDLE>} completionEvent An event handle that is signaled when the  print job finishes.  This event is guaranteed to be signaled exactly once per <b>StartXpsPrintJob</b> call.  The XPS Print API does not reset this event—that is the caller's responsibility.
     * 
     * If no completion notification is required, this parameter can be set to <b>NULL</b>.
     * @param {Pointer<Byte>} printablePagesOn The parameter references a UINT8 array whose elements specify a subset of a document's pages to be printed. As shown in the table that follows, the value of each element indicates whether the page is to be printed.
     * 
     * <table>
     * <tr>
     * <th>Array Element Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not print the page.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>Non-zero</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Print the page.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Progress events will  be signaled only for the pages that are designated for printing.  
     * 
     * The elements in the array represent all pages that are designated for printing, in all  documents of the XPS package.  For example, if the package contains two documents that have three pages each, the array shown in the following table designates the printing of pages 0 and 2 from document 1, and pages 0 and 2 from document 2.  
     * 
     * <table>
     * <tr>
     * <th>Element index</th>
     * <th>Element Value</th>
     * <th>Print?</th>
     * <th>Document number</th>
     * <th>Page number</th>
     * </tr>
     * <tr>
     * <td>5</td>
     * <td>1</td>
     * <td>Yes</td>
     * <td>2</td>
     * <td>2</td>
     * </tr>
     * <tr>
     * <td>4</td>
     * <td>0</td>
     * <td>No</td>
     * <td>2</td>
     * <td>1</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>1</td>
     * <td>Yes</td>
     * <td>2</td>
     * <td>0</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>1</td>
     * <td>Yes</td>
     * <td>1</td>
     * <td>2</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>0</td>
     * <td>No</td>
     * <td>1</td>
     * <td>1</td>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>1</td>
     * <td>Yes</td>
     * <td>1</td>
     * <td>0</td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>printablePagesOn</i> is <b>NULL</b>, all pages in the package will be printed.
     * 
     * If <i>printablePagesOn</i> has more elements than there are pages in the package, the superfluous elements will be ignored.
     * 
     * If the array has fewer elements than there are pages in the document, the value of the last array element of the array is applied to the remaining pages.  This rule makes it easier to specify a range that is open-ended or that gets only a few pages of a large  document printed.
     * @param {Integer} printablePagesOnCount The number of elements in the array that is referenced by <i>printablePagesOn</i>.  If <i>printablePagesOn</i> is <b>NULL</b>, this parameter is ignored.
     * @param {Pointer<IXpsPrintJob>} xpsPrintJob A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsprint/nn-xpsprint-ixpsprintjob">IXpsPrintJob</a> interface that represents the print job that is created by <b>StartXpsPrintJob</b>.  To get the status of the print job or to cancel it, use the <b>IXpsPrintJob</b> interface. If an <b>IXpsPrintJob</b> is not required, this parameter can be set to <b>NULL</b>.
     * @param {Pointer<IXpsPrintJobStream>} documentStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsprint/nn-xpsprint-ixpsprintjobstream">IXpsPrintJobStream</a> interface into which the caller  writes the XPS document to be printed by this print job.
     * @param {Pointer<IXpsPrintJobStream>} printTicketStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsprint/nn-xpsprint-ixpsprintjobstream">IXpsPrintJobStream</a> interface that is  used by  the caller to write the job-level print ticket that will be associated with this job.  If this parameter is set to <b>NULL</b>, the print tickets (if any exist) from the XPS document that is written to <i>documentStream</i> will be used.
     * @returns {Integer} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>printerName</i> or <i>documentStream</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory to create a new <a href="https://docs.microsoft.com/windows/desktop/api/xpsprint/nn-xpsprint-ixpsprintjob">IXpsPrintJob</a> object.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsprint/nf-xpsprint-startxpsprintjob
     * @since windows6.1
     */
    static StartXpsPrintJob(printerName, jobName, outputFileName, progressEvent, completionEvent, printablePagesOn, printablePagesOnCount, xpsPrintJob, documentStream, printTicketStream) {
        result := DllCall("XPSPRINT.dll\StartXpsPrintJob", "ptr", printerName, "ptr", jobName, "ptr", outputFileName, "ptr", progressEvent, "ptr", completionEvent, "ptr", printablePagesOn, "uint", printablePagesOnCount, "ptr", xpsPrintJob, "ptr", documentStream, "ptr", printTicketStream, "int")
        return result
    }

    /**
     * Creates a print job for sending XPS document content to a printer.
     * @remarks
     * <b>StartXpsPrintJob1</b> is an asynchronous function, and therefore it can return before the print spooler creates or starts a print job.
     * 
     * Do not use the interfaces that are returned in <i>xpsPrintJob</i> and <i>xpsOMPackageTarget</i> until <b>StartXpsPrintJob1</b> has returned successfully.
     * 
     *   After the caller starts sending data, it is a good programming practice to monitor the progress events that are signaled to the event that is passed in <i>progressEvent</i>. When the event is signaled, the caller must  call <a href="https://docs.microsoft.com/windows/desktop/api/xpsprint/nf-xpsprint-ixpsprintjob-getjobstatus">IXpsPrintJob::GetJobStatus</a> to get the current status of the print job.
     * 
     * When the print job finishes, whether successfully or not, the event that is passed in <i>completionEvent</i> is signaled only once. To prevent data loss, it is a good programming practice for the caller to monitor the completion event and ensure that neither the thread nor the application that created the print job are terminated until the completion event  has been signaled.
     * 
     * Job states are neither stored nor queued by the print spooler. Because job processing does not wait for the status to be read after events are signaled,  the caller might miss some state changes, depending on the delay between the time the application received the change notification and the time it called <a href="https://docs.microsoft.com/windows/desktop/api/xpsprint/nf-xpsprint-ixpsprintjob-getjobstatus">IXpsPrintJob::GetJobStatus</a>. To receive subsequent notifications, the application must reset the progress event after it has received the notification.
     * 
     * If a call to <b>StartXpsPrintJob1</b> fails,  the print spooler updates the job status, signals the  completion and progress events, and returns an error code. To get the status of the failed print job, call <a href="https://docs.microsoft.com/windows/desktop/api/xpsprint/nf-xpsprint-ixpsprintjob-getjobstatus">IXpsPrintJob::GetJobStatus</a>.
     * 
     * <b>StartXpsPrintJob1</b> calls <b>DuplicateHandle</b> on <i>completionEvent</i> and <i>progressEvent</i> to ensure that they remain valid for the lifetime of the job.  Because the print spooler is using a duplicate handle for the events,   the caller can close these handles at any point without affecting job execution.  However,  we recommend for the caller to close these handles only after the <i>completionEvent</i> event has been signaled and the caller observed it.
     * 
     * <div class="alert"><b>Note</b>   When your application prints to a file, the application is responsible for providing the value to pass in the <i>outputFileName</i> parameter for print-to-file operations.  To print to a printer that uses a  driver that outputs to the FILE: port, the caller must retrieve the file name from the user by displaying the common file dialog box.
     * </div>
     * <div> </div>
     * @param {Pointer<PWSTR>} printerName The name of the printer with which this job will be associated.
     * @param {Pointer<PWSTR>} jobName A user-specified  job name to be associated with this job.  You can set this parameter to <b>NULL</b> if the job does not require a  separate, user-specified name.
     * @param {Pointer<PWSTR>} outputFileName The  file name of the file or port into which the output of this job is to be redirected.  Setting this value will cause the output of the print job to be directed to the specified file or port. To send the print job to the printer that is specified by <i>printerName</i>, you must set this parameter to <b>NULL</b>.
     * @param {Pointer<HANDLE>} progressEvent An event handle that is signaled when one of the following print job changes occur:
     * <ul>
     * <li>A job ID is assigned to the print job</li>
     * <li>Printing of a page has finished</li>
     * <li>Printing of a document has finished</li>
     * <li>The print job has been canceled or has ended because of an error</li>
     * </ul>
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  This event will not be signaled until after the application has started sending data to the print job.</div>
     * <div> </div>
     * 
     * 
     * The XPS Print API does not reset this event—that is the caller's responsibility.
     * 
     * 
     * Set this parameter to <b>NULL</b> if you do not want to be notified about  progress.
     * @param {Pointer<HANDLE>} completionEvent An event handle that is signaled when the  print job finishes.  This event is guaranteed to be signaled exactly once per <b>StartXpsPrintJob1</b> call.  The XPS Print API does not reset this event—that is the caller's responsibility.
     * 
     * Set this parameter to <b>NULL</b> if do not want to be notified about completion.
     * @param {Pointer<IXpsPrintJob>} xpsPrintJob A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsprint/nn-xpsprint-ixpsprintjob">IXpsPrintJob</a> interface that represents the print job that  <b>StartXpsPrintJob1</b> created.  To get the status of the print job or to cancel it, use the <b>IXpsPrintJob</b> interface. Set this parameter to <b>NULL</b> if you do not need it.
     * @param {Pointer<IXpsOMPackageTarget>} printContentReceiver A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ff970304(v=vs.85)">IXpsOMPackageTarget</a> interface that this function created. This parameter is required and you cannot set it to <b>NULL</b>.
     * 
     * To send document content to the print job that this function created, use the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackagewriter">IXpsOMPackageWriter</a> interface that you  create by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ff970305(v=vs.85)">CreateXpsOMPackageWriter</a> method of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ff970304(v=vs.85)">IXpsOMPackageTarget</a> interface returned in <i>xpsOMPackageTarget</i>.
     * @returns {Integer} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>printerName</i> or <i>xpsOMPackageTarget</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory to create a new <a href="https://docs.microsoft.com/windows/desktop/api/xpsprint/nn-xpsprint-ixpsprintjob">IXpsPrintJob</a> object.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsprint/nf-xpsprint-startxpsprintjob1
     * @since windows6.1
     */
    static StartXpsPrintJob1(printerName, jobName, outputFileName, progressEvent, completionEvent, xpsPrintJob, printContentReceiver) {
        result := DllCall("XPSPRINT.dll\StartXpsPrintJob1", "ptr", printerName, "ptr", jobName, "ptr", outputFileName, "ptr", progressEvent, "ptr", completionEvent, "ptr", xpsPrintJob, "ptr", printContentReceiver, "int")
        return result
    }

;@endregion Methods
}
