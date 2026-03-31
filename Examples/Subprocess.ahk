#Requires AutoHotkey v2.0

#Include <AhkWin32Projection\Windows\Win32\Foundation\HANDLE_FLAGS>
#Include <AhkWin32Projection\Windows\Win32\System\Pipes\Apis>
#Include <AhkWin32Projection\Windows\Win32\System\Threading\Apis>
#Include <AhkWin32Projection\Windows\Win32\System\Threading\STARTUPINFOW>
#Include <AhkWin32Projection\Windows\Win32\System\Threading\STARTUPINFOW_FLAGS>
#Include <AhkWin32Projection\Windows\Win32\System\Threading\PROCESS_INFORMATION>
#Include <AhkWin32Projection\Windows\Win32\Security\SECURITY_ATTRIBUTES>

; Demonstrates the use of AhkWin32Projection wrappers to run the AHK interpreter as a subprocess,
; send data to stdin, and capture stdout and stderr in variables

; This example mostly follows this c++ tutorial:
; https://learn.microsoft.com/en-us/windows/win32/procthread/creating-a-child-process-with-redirected-input-and-output

; Set security attributes to allow handle inheritance
attrs := SECURITY_ATTRIBUTES()
attrs.nLength := SECURITY_ATTRIBUTES.sizeof
attrs.bInheritHandle := true

; Create stdin / stdout / stderr pipes
Pipes.CreatePipe(hOutRd := HANDLE(), hOutWt := HANDLE(), attrs, 0)
Pipes.CreatePipe(hErrRd := HANDLE(), hErrWt := HANDLE(), attrs, 0)
Pipes.CreatePipe(hInRd := HANDLE(), hinWt := HANDLE(), attrs, 0)

; Remove inherit flag from read ends of our output / error pipes and write end of the in pipe
Foundation.SetHandleInformation(hOutRd, HANDLE_FLAGS.HANDLE_FLAG_INHERIT, 0)
Foundation.SetHandleInformation(hErrRd, HANDLE_FLAGS.HANDLE_FLAG_INHERIT, 0)
Foundation.SetHandleInformation(hInWt, HANDLE_FLAGS.HANDLE_FLAG_INHERIT, 0)

; Create startup info with our pipe handles
; IMPORTANT - we don't transfer ownership to the struct - we want the handle lifetime to be managed
; by the handle objects we created in our calls to CreatePipe
startInfo := STARTUPINFOW()
startInfo.cb := STARTUPINFOW.sizeof
startInfo.hStdError.Value := hErrWt.Value
startInfo.hStdError.owned := false
startInfo.hStdOutput.Value := hOutWt.Value
startInfo.hStdOutput.owned := false
startInfo.hStdInput.Value := hInRd.Value
startInfo.hStdInput.owned := false
startInfo.dwFlags |= STARTUPINFOW_FLAGS.STARTF_USESTDHANDLES

; Allocate output struct
procInfo := PROCESS_INFORMATION()

; Run subprocess
Threading.CreateProcessW(
    0,      ; Use command line (below)
    A_AhkPath " *",
    0,      ; Default process security attributes
    0,      ; Default thread security attributes
    true,   ; Inherit handles
    0,      ; Default creation flags
    0,      ; Inherit environment
    0,      ; Inherit pwd
    startInfo,
    procInfo
)

; close handles to child process and thread - we'll monitor it via PID
; note that because these are returned in a struct, they aren't automatically
; wrapped in handle objects and won't be closed automatically
procInfo.hProcess.Free()
procInfo.hThread.Free()

; FileOpen on a handle with 'h' wraps the pointer in a File Object. Note the AHK file won't close the pipe 
; automatically and Close() does nothing. This gives us access to nicer write functions
inFile := FileOpen(hinWt.Value, "h")

inFile.WriteLine("FileAppend('This is going to stdout', '*')")
inFile.WriteLine("FileAppend('This is going to stderr', '**')")

; Clear the file variable to prevent confusion, free the handle to the subprocess's
; stdin pipe to close it and trigger execution
inFile := ""
hinWt.Free()

; Wait for execution to finish
ProcessWaitClose(procInfo.dwProcessId)

; Read stdout and stderr from our pipes, again wrapping in an AHK File object via the "h" open mode
subProcOut := FileOpen(hOutRd.Value, "h").Read()
subProcErr := FileOpen(hErrRd.Value, "h").Read()

MsgBox(Format("Subprocess finished`n    Stdout: '{1}'`n    Stderr: '{2}'", subProcOut, subProcErr))

; AhkWin32 handles will dispose of themselves in __Delete - no need to explicitly close them
