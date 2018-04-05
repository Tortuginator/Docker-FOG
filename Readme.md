#FogProject Docker image

>This project is in no way affiliated with the FOG Project 

----
##What is this 'thing'?
The FogProject is a opensource image server. For more details see [FogProject.org](http://FogProject.org). This Docker Container contains one self-sustaining Fog server instance, excluding the DHCP server. The fog servers version is, when not otherwise mentioned, the newest version from the github main branch. (Currently: v1.5.0)

##How can is use it?
To run a instance start Docker with:

    docker run -it -p 212:212/udp -p 9098:9098 -p 21:21 -p 80:80 -p 69:69/udp -p 8099:8099 -p 2049:2049 -p 2049:2049/udp -p 111:111/udp -p 4045:4045/udp -p 4045:4045 -p 111:111 -p 34463:34463/udp -p 34463:34463 --privileged -h fogProjectServer -e EXTIP=0.0.0.0 ubuntu:latest


Please adjust the **EXTERNAL_DHCP** variable to your DHCP server. This is nessecary, since the Docker image does not contain a DHCP server. Additionally, as stated above. The docker container has to be run in **--priviledged** mode. Not using it, might result in faulty boot procedures. To ensure that your DHCP server works properly with the fog server, follow the [in the official Wiki](https://wiki.fogproject.org/wiki/index.php/Modifying_existing_DHCP_server_to_work_with_FOG) described steps to reconfigure your DHCP server.
When correctly setup, a loginpage should appear at: [http://172.0.0.1:80/fog/](http://172.0.0.1:80/fog)(Change the IP according to your local IP). As of version 1.5.0 it is configured with following login credentials:

>Username:fog

>Password:password

It is Highly recommandet to **IMEDIATELY** change theese upon first login.

##Disclaimer
THIS SOFTWARE IS PROVIDED ''AS IS'' AND ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE CONTRIBUTOR(S) BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
